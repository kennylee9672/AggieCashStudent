//
//  LoginViewController.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 1/29/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase

let PHONE_NUMBER_LEN = 10
let US_CODE = "+1"

class LoginViewController: UIViewController {
    
    @IBOutlet weak var OTPfield: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    let ui = UIcontroller()
    var verificationID = ""
    
    /**
     * ViewController Inialization
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testFS();
        self.setUI()
    }
    func testFS(){
       
    }
    /**
     * Button Actions
     */
    @IBAction func touchSend(_ sender: Any) {
        self.sendOTP()
        
    }
    
    @IBAction func touchSignIn(_ sender: Any) {
        self.signIn()
//        navigateToHome()
    }
    
    /**
     * Phone number sign in methods
     */
    func sendOTP() {
        print("DEBUG: Sending OTP to user")
        if let str = checkInput() {
             let phoneNumber = str // With auto fill phonenumber feature
//            let phoneNumber = US_CODE + str
            PhoneAuthProvider.provider()
                .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                if let error = error {
                    print("DEBUG: \(error)")
                    return
                }
                if let id = verificationID {
                    print("DEBUG: Sucessfully send code to user")
                    self.messageLable.isHidden = true
                    UserDefaults.standard.set(id, forKey: "authVerificationID")
                    self.verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
                    
                }
            }
        }
        return
    }
    
    @objc func inputChanges(OTPfield: UITextField) {
        let text = OTPfield.text
        if text?.utf16.count == 6{
            activityIndicator.hidesWhenStopped = true
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false
            view.addSubview(activityIndicator)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
            self.signIn()
            self.activityIndicator.stopAnimating()
            }
        }
    }
    func signIn() {
        self.activityIndicator.startAnimating()
        print("DEBUG: Signing in user")
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.verificationID,
            verificationCode: self.OTPfield.text!)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("DEBUG: \(error)")
                self.displayError()
                self.activityIndicator.stopAnimating()
                return
            }
            print("DEBUG: Sucessfully sign in user")
            self.activityIndicator.stopAnimating()
            self.navigateToHome()
        }
    }
    
    func checkInput() -> String? {
        if let str: String = phoneNumberField.text {
            if str.count != PHONE_NUMBER_LEN {
//                if(str.count == 12 && str.prefix(2) == "+1"){
//                    return str.dropFirst(2)
//                }
                displayError()
            }
            return str
        }
        return nil
    }
    
    /**
     * Helper methods:
     */
    func displayError() {
        self.messageLable.text = "Invalid Phone Number"
    }
    
    func setUI() {
        self.ui.setButtonUI(bn: self.verifyButton)
        self.ui.setButtonUI(bn: self.signInButton)
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
        self.ui.setNavigationBarUI(on: self)
        self.ui.setKeyboardDismiss(on: self)
        OTPfield.addTarget(self, action: #selector(inputChanges),
                                 for: UIControl.Event.editingChanged)
    }
    
    func navigateToHome() {
        // *Note: change "Other" to your storyboard name
        let homeViewController = UIStoryboard(name: "Other", bundle: nil)
            .instantiateViewController(withIdentifier: "HomeTabBarViewController") as? UITabBarController
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
}

