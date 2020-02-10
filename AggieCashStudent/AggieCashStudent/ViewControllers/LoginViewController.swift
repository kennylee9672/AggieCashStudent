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

let INVALID_INFO = 0
let NIL_INFO = 1
let VERIFY_ERR = 2
let DEFAULT_ERR = 3

class LoginViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let ui = UIcontroller()
    let LoginErrors: [Int : String] = [
        INVALID_INFO : "Please enter both email and password.",
        NIL_INFO : "Invalid email or password.",
        VERIFY_ERR : "Pleas check your network.",
        DEFAULT_ERR : "Error."
    ]
    var verificationID: String = ""
    var isPhoneSignIn = true // Default
    
    /**
     * ViewController Inialization:
     */
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupGoogleSignIn()
        self.setUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
    }
    
    /**
     * Button Actions:
     */
    @IBAction func touchSend(_ sender: Any) {
        self.sendOTP()
    }
    
    @IBAction func touchSignIn(_ sender: Any) {
        self.signIn()
    }
    
    // MARK: GIDSignInDelegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                print("Login Successful")
                self.navigateToHome()
                // START ACTIVITY INDICATOR HERE

                //This is where you should add the functionality of successful login
                //i.e. dismissing this view or push the home view controller etc
            }
        }
    }
    
    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    func signIn() {
        print("DEBUG: Signing in user")
        
        if self.isPhoneSignIn {
            // Phone number sign in
            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: self.verificationID,
                verificationCode: self.emailField.text!)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print("DEBUG: \(error)")
                    return
                }
                print("DEBUG: Sucessfully sign in user")
            }
        }
        else {
            // Google email sign in
            GIDSignIn.sharedInstance().signIn()
        }
    }
    
    func sendOTP() {
        PhoneAuthProvider.provider().verifyPhoneNumber("+16507668662", uiDelegate: nil) { (verificationID, error) in
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
    
    func setUI() {
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
        self.ui.setNavigationBarUI(on: self)
        self.ui.setKeyboardDismiss(on: self)
    }
    
    /**
     * Helper method:
     *
     * Verify login information
     * UI setting
     * ViewController segue
     */
    func verifyLogin(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { res, error in
            if error != nil {
                self.displayError(with: INVALID_INFO)
            } else {
                if let isVerified = Auth.auth().currentUser?.isEmailVerified {
                    if (isVerified) {
                        self.navigateToHome()
                    } else {
                        self.displayError(with: VERIFY_ERR)
                    }
                }
            }
        }
    }
    
    func displayError(with type: Int) {
        self.messageLable.text = LoginErrors[type]
    }
    
    func navigateToSignup() {
        // TODO:
    }
    
    func navigateToHome() {
        // TODO:
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarViewController") as? UITabBarController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
}
