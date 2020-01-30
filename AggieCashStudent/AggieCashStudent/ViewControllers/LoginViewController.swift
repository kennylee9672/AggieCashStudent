//
//  LoginViewController.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 1/29/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
//    @IBOutlet weak var emailField: UITextField!
//    @IBOutlet weak var passwordField: UITextField!
//    @IBOutlet weak var messageLable: UILabel!
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet weak var loginButton: UIButton!
//    @IBOutlet weak var signupButton: UIButton!
//    @IBOutlet weak var rememberMeButton: UIButton!
//
//    var loginEmail: String = ""
//    var loginPassword: String = ""
//    var rememberMeChecked: Bool = false
//    let ui: UIController = UIController()
//    let uncheckBoxImg = UIImage(named: "uncheckBox")
//    let checkBoxImg = UIImage(named: "checkBox")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.messageLable.isHidden = true
//        self.activityIndicator.isHidden = true
//        self.setupKeyboardDismiss()
//        self.setUI()
//        self.checkDefaults()
//        self.setTFs()
//    }
//
//    func setTFs() {
//        self.emailField.text = self.loginEmail
//        self.passwordField.text = self.loginPassword
//    }
//
//    func checkDefaults() {
//        guard let prevEmail = Memory.email, let prevPW = Memory.password else {
//            print("No previous user info stored!")
//            return
//        }
//
//        self.loginEmail = prevEmail
//        self.loginPassword = prevPW
//    }
//
//    func setUI() {
//        self.ui.setNavigationBarUI(vc: self)
//        self.ui.setButtonUI(bn: self.loginButton)
//        self.ui.setButtonUI(bn: self.signupButton)
//        self.ui.setTextFieldUI(tf: self.emailField)
//        self.ui.setTextFieldUI(tf: self.passwordField)
//        self.rememberMeButton.setBackgroundImage(self.uncheckBoxImg, for: .normal)
//    }
//
//    // reset all messages when navigated away from this view
//    override func viewDidDisappear(_ animated: Bool) {
//        self.messageLable.isHidden = true
//        self.activityIndicator.isHidden = true
//    }
//
//    @IBAction func touchRememberMe(_ sender: UIButton) {
//        if let image = sender.currentBackgroundImage {
//            if image.isEqual(self.uncheckBoxImg)  {
//                sender.setBackgroundImage(self.checkBoxImg, for: .normal)
//                self.rememberMeChecked = true
//            } else {
//                sender.setBackgroundImage(self.uncheckBoxImg, for: .normal)
//                self.rememberMeChecked = false
//            }
//        }  else {
//            sender.setBackgroundImage(self.uncheckBoxImg, for: .normal)
//            self.rememberMeChecked = false
//        }
//    }
//
//    @IBAction func touchLogin(_ sender: Any) {
//        if self.loginEmail == "" || self.loginPassword == "" {
//            self.customErrorLabel(isError: true, message: "Invalid email or password")
//        } else {
//            Auth.auth().signIn(withEmail: self.loginEmail, password: self.loginPassword) { (authResult, error) in
//                if let err = error {
//                    print("ERRORRRRR: ",err)
//                    self.customErrorLabel(isError: true, message: "Username or password incorrect.")
//                } else {
//                    if let verified = Auth.auth().currentUser?.isEmailVerified {
//                        if (verified) {
//                            if self.rememberMeChecked {
//                                Memory.email = self.loginEmail
//                                Memory.password = self.loginPassword
//                            }
//                            self.navigateToHome()
//                        } else {
//                            print("not verified!")
//                        }
//                    } else {
//                        print("email not sent yet")
//                    }
//                }
//
//            }
//        }
//
//    }
//
//    @IBAction func touchSignup(_ sender: Any) {
//        navigateToSignup()
//    }
//
//    @IBAction func loginEmailFilled(_ sender: UITextField) {
//        if let email = sender.text {
//            self.loginEmail = email
//        } else {
//            self.customErrorLabel(isError: true, message: "Please enter a valid email address")
//        }
//    }
//
//    @IBAction func passwordFilled(_ sender: UITextField) {
//        if let password = sender.text {
//            self.loginPassword = password
//        } else {
//            self.customErrorLabel(isError: true, message: "Please enter your password")
//        }
//    }
//
//    @IBAction func forgetPwTouched(_ sender: UIButton) {
//        if let email = self.emailField.text {
//            if email == "" {
//                self.customErrorLabel(isError: true, message: "Please enter your email")
//            } else {
//                Auth.auth().sendPasswordReset(withEmail: email) { error in
//                     if let err = error {
//                        self.customErrorLabel(isError: true, message: err.localizedDescription)
//                     } else {
//                        self.customErrorLabel(isError: false, message: "We sent you an email with your reset password request")
//                        //delete Memory password
//                        Memory.password = ""
//                     }
//                 }
//            }
//        }
//
//    }
//
//    func customErrorLabel(isError: Bool, message: String) {
//        self.messageLable.text = message
//        if isError {
//            self.messageLable.textColor = UIColor.red
//        } else {
//            //TODO: need to change color
//            self.messageLable.textColor = UIColor.green
//        }
//        self.messageLable.isHidden = false
//    }
//
//    func setupKeyboardDismiss() {
//         let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
//         tap.cancelsTouchesInView = false
//         self.view.addGestureRecognizer(tap)
//     }
//
//    func navigateToSignup() {
//        print("Navigated to Signup View Controller!")
//        let mainStoryboard =  UIStoryboard(name: "Main", bundle: nil)
//        let signupVC = mainStoryboard
//            .instantiateViewController(identifier: "SignupViewController") as! SignupViewController
//        signupVC.delegate = self
//        //self.navigationController?.pushViewController(signupVC, animated: true)
//        self.present(signupVC, animated: true, completion: nil)
//    }
//
//    func navigateToHome() {
//        print("Navigated to Home View Controller!")
//        let mainStoryboard =  UIStoryboard(name: "Main", bundle: nil)
//        let tabBarVC = mainStoryboard.instantiateViewController(identifier: "TabBarViewController") as! UITabBarController
//        tabBarVC.modalPresentationStyle = .fullScreen
//        present(tabBarVC, animated: true)
//    }
//
//    // MARK: Signup VC Delegate
//    func didSignup(message: String) {
//        self.messageLable.text = message
//        self.messageLable.textColor = UIColor.green
//        self.messageLable.isHidden = false
//    }

}
