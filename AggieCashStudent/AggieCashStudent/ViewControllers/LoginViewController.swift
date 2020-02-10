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
    
    let ui = UIcontroller()
    var verificationID = ""
    
    /**
     * ViewController Inialization
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    /**
     * Button Actions
     */
    @IBAction func touchSend(_ sender: Any) {
        self.sendOTP()
    }
    
    @IBAction func touchSignIn(_ sender: Any) {
        self.signIn()
    }
    
    /**
     * Phone number sign in methods
     */
    func sendOTP() {
        print("DEBUG: Sending OTP to user")
        if let str = checkInput() {
            let phoneNumber = US_CODE + str
            PhoneAuthProvider.provider()
                .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                if let error = error {
                    print("DEBUG: \(error)")
                    return
                }
                if let id = verificationID {
                    print("DEBUG: Sucessfully send code to user")
                    UserDefaults.standard.set(id, forKey: "authVerificationID")
                    self.verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
                }
            }
        }
        return
    }
    
    func signIn() {
        print("DEBUG: Signing in user")
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.verificationID,
            verificationCode: self.OTPfield.text!)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("DEBUG: \(error)")
                self.displayError()
                return
            }
            print("DEBUG: Sucessfully sign in user")
            self.navigateToHome()
        }
    }
    
    func checkInput() -> String? {
        if let str: String = phoneNumberField.text {
            if str.count != PHONE_NUMBER_LEN {
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
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
        self.ui.setNavigationBarUI(on: self)
        self.ui.setKeyboardDismiss(on: self)
    }
    
    func navigateToHome() {
        // *Note: change "Other" to your storyboard name
        let homeViewController = UIStoryboard(name: "Other", bundle: nil)
            .instantiateViewController(withIdentifier: "HomeTabBarViewController") as? UITabBarController
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
}

