////
////  SignUpViewController.swift
////  AggieCashStudent
////
////  Created by Kenny Li on 1/29/20.
////  Copyright © 2020 AggieCashStudent. All rights reserved.
////
//
//import UIKit
//import FirebaseAuth
//import FirebaseFirestore
//
//class SignUpViewController: UIViewController {
//
//    @IBOutlet weak var firstNameField: UITextField!
//    @IBOutlet weak var lastNameField: UITextField!
//    @IBOutlet weak var emailField: UITextField!
//    @IBOutlet weak var passwordField: UITextField!
//    @IBOutlet weak var messageLable: UILabel!
//    @IBOutlet weak var signUpButton: UIButton!
//
//    let ui = UIcontroller()
//    let db = Firestore.firestore()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setUI()
//    }
//
//    //can put the server call into a function
//    @IBAction func touchSignup(_ sender: Any) {
//        if let email = self.emailField.text,
//            let firstName = self.firstNameField.text,
//            let lastName = self.lastNameField.text,
//            let password = self.passwordField.text {
//
//            let name = firstName + " " + lastName
//            if checkPassword(password: password) {
//                self.verifySignup(email: email, name: name, password: password)
//            }
//            else {
//                //TODO: display error message
//            }
//        }
//    }
//
//    func displayErrorMessage(with type: Int) {
//        self.messageLable.isHidden = false
//        //self.messageLable.text = ...
//    }
//
//    func verifySignup(email: String, name: String, password: String) {
//        AuthViewController.auth().createUser(withEmail: email, password: password) { res, error in
//            if error != nil {
//                self.messageLable.isHidden = false
//                // TODO: display error message
//            }
//            else if let data = res {
//                let profileChangeRequest = data.user.createProfileChangeRequest()
//                profileChangeRequest.displayName = name
//                profileChangeRequest.commitChanges { error in
//
//                }
//                //self.writeData(data.user.uid, email: email, name: name)
//                //self.sendVerification()
//                self.messageLable.isHidden = true
//                self.navigateToLogin()
//            }
//        }
//    }
//
//    func writeData(_ thisUID: String, email: String, name: String) {
//        let ref: DocumentReference = self.db.collection("users").document(thisUID)
//        ref.setData([
//            "uid" : thisUID,
//            "email": email,
//            "accName": name,
//            "imageName": "aggie-logo",
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(ref.documentID)")
//            }
//
//        }
//    }
//
//    func checkPassword(password: String) -> Bool {
//        // At least 8 chars, 1 number and 1 capitalized
//        return (
//            password.count>=8 &&
//                password.rangeOfCharacter(from: .decimalDigits) != nil &&
//                password.rangeOfCharacter(from: .uppercaseLetters) != nil
//        )
//    }
//
//    func sendVerification() {
//        AuthViewController.auth().currentUser?.sendEmailVerification{(error) in
//            if error == nil {
//                print("verification sent!")
//            } else {
//                print(error?.localizedDescription ?? "no error?!")
//            }
//        }
//
//    }
//
//    func setUI() {
//        self.messageLable.isHidden = true
//        self.ui.setKeyboardDismiss(on: self)
//        self.ui.setNavigationBarUI(on: self)
//        //self.ui.setButtonUI(bn: self.signUpButton)
//        //self.ui.setTextFieldUI(tf: self.firstNameField)
//        //self.ui.setTextFieldUI(tf: self.lastNameField)
//        //self.ui.setTextFieldUI(tf: self.emailField)
//        //self.ui.setTextFieldUI(tf: self.passwordField)
//    }
//
//    func navigateToLogin() {
//        print("Navigated back to Login!")
//    }
//
//    //
//    //    @IBAction func firstNameFilled(_ sender: UITextField) {
//    //        if let firstName = sender.text {
//    //            messageLable.isHidden = true
//    //            self.userFirstName = firstName
//    //            sender.resignFirstResponder()
//    //        } else {
//    //            messageLable.isHidden = false
//    //            messageLable.text = "Please enter your first name"
//    //        }
//    //
//    //    }
//    //
//    //    @IBAction func lastNameFilled(_ sender: UITextField) {
//    //        if let lastName = sender.text {
//    //            messageLable.isHidden = true
//    //            self.userLastName = lastName
//    //            sender.resignFirstResponder()
//    //        } else {
//    //            messageLable.isHidden = false
//    //            messageLable.text = "Please enter your last name"
//    //        }
//    //    }
//    //
//    //    @IBAction func emailFilled(_ sender: UITextField) {
//    //        if let email = sender.text {
//    //            messageLable.isHidden = true
//    //            self.userEmail = email
//    //            sender.resignFirstResponder()
//    //        } else {
//    //            messageLable.isHidden = false
//    //        }
//    //    }
//    //
//    //    @IBAction func passwordFilled(_ sender: UITextField) {
//    //     if let password = sender.text {
//    //        if checkPassword(password: password) {
//    //            print("valid password")
//    //            messageLable.isHidden = true
//    //            self.userPassword = password
//    //            sender.resignFirstResponder()
//    //
//    //          } else {
//    //            messageLable.isHidden = false
//    //            sender.text = ""
//    //            self.userPassword = ""
//    //            messageLable.text = "Password needs to have at least 8 characters, 1 number and 1 capitalized letter"
//    //          }
//    //      } else {
//    //          messageLable.isHidden = false
//    //          messageLable.text = "Please choose a password"
//    //      }
//    //    }
//}
