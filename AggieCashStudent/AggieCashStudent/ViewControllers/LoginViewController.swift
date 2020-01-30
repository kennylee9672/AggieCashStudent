//
//  LoginViewController.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 1/29/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //let ui: UIcontroller = UIcontroller()
    
    // VC inialization
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupKeyboardDismiss()
        self.setUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
    }
    
    // Touch actions
    @IBAction func touchLogin(_ sender: Any) {
        if let email = self.emailField.text,
            let password = self.passwordField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    //TODO: display error message
                } else {
                    if let verified = Auth.auth().currentUser?.isEmailVerified {
                        if (verified) {
                            self.navigateToHome()
                        } else {
                            print("Error: not verified")
                        }
                    }
                }
            }
            
        } else {
            //TODO: display error message
            return
        }
    }
    
    @IBAction func touchSignup(_ sender: Any) {
        navigateToSignup()
    }
    
    // UI setting
    func setUI() {
        self.messageLable.isHidden = true
        self.activityIndicator.isHidden = true
        //        self.ui.setNavigationBarUI(vc: self)
        //        self.ui.setButtonUI(bn: self.loginButton)
        //        self.ui.setButtonUI(bn: self.signupButton)
        //        self.ui.setTextFieldUI(tf: self.emailField)
        //        self.ui.setTextFieldUI(tf: self.passwordField)
    }
    
    func setupKeyboardDismiss() {
        // TODO: put this into UIcontroller
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    // VC Mavigation
    func navigateToSignup() {
        // TODO:
    }
    
    func navigateToHome() {
        // TODO:
    }
}
