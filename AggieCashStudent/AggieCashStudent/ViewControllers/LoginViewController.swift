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
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var loginOrSignupButton: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //    @IBOutlet weak var signInButton: GIDSignInButton!
    
    let ui = UIcontroller()
    let LoginErrors: [Int : String] = [
        INVALID_INFO : "Please enter both email and password.",
        NIL_INFO : "Invalid email or password.",
        VERIFY_ERR : "Pleas check your network.",
        DEFAULT_ERR : "Error."
    ]
    
    /**
     * ViewController Inialization:
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        self.setupGoogleSignIn()
        self.setUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
    }
    
    /**
     * Button Actions:
     */
    @IBAction func googleSignInPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    @IBAction func touchSegmentControl(_ sender: Any) {
        let index = self.loginOrSignupButton.selectedSegmentIndex
        switch index {
        case 0:
            if let email = self.emailField.text,
                let password = self.passwordField.text {
                verifyLogin(email: email, password: password)
            }
            else {
                self.displayError(with: NIL_INFO)
            }
            break
        case 1:
            navigateToSignup()
            break
        default:
            self.displayError(with: DEFAULT_ERR)
            break
        }
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
    
    func setUI() {
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
        self.ui.setNavigationBarUI(on: self)
        self.ui.setKeyboardDismiss(on: self)
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
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}
