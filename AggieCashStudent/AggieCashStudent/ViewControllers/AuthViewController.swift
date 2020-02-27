//
//  PaymentViewController.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 2/26/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit
import LocalAuthentication
import Foundation

class AuthViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var faceIDLabel: UILabel!
    
    var context = LAContext()
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    var state = AuthenticationState.loggedout {
        didSet {
            self.continueButton.isHighlighted = state == .loggedin
            self.faceIDLabel.isHidden = (state == .loggedin) || (context.biometryType != .faceID)
            //self.stateView.backgroundColor = state == .loggedin ? .green : .red
        }
    }
    
    override func viewDidLoad() {
        self.context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        self.state = .loggedout
    }
    
    @IBAction func touchLogin(_ sender: UIButton) {
        print("DEBUG: touch Pay!")
        if self.state == .loggedin {
            self.state = .loggedout
        }
        else {
            self.verify()
        }
    }
    
    func verify() {
        print("DEBUG: In verify()")
        context = LAContext()
        context.localizedCancelTitle = "Enter Username/Password"
        
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            
            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                
                if success {
                    print("DEBUG: Sucessfully login user!")
                    // Move to the main thread because a state update triggers UI changes.
                    DispatchQueue.main.async { [unowned self] in
                        self.state = .loggedin
                    }
                    
                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")
                    
                    // Fall back to a asking for username and password.
                    // ...
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
            
            // Fall back to a asking for username and password.
            // ...
        }
        
    }
    
}
