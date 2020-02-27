//
//  CartViewController.swift
//  AggieCashStudent
//
//  Created by Adila on 1/30/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit
import LocalAuthentication
import Foundation

// MARK: do info plish - ok
// MARK: connect storyboard - ok

class CartViewController: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var faceIDLabel: UILabel!
    
    var ui = UIcontroller()
    var context = LAContext()
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    var state = AuthenticationState.loggedout {
        didSet {
            self.continueButton.isHighlighted = state == .loggedin
            self.faceIDLabel.isHidden = (state == .loggedin) || (context.biometryType != .faceID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Loading cart view.")
        self.context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        self.state = .loggedout
    }
    
    @IBAction func touchContinue(_ sender: UIButton) {
        print("DEBUG: Touch Continue.")
        if self.state == .loggedin {
            self.state = .loggedout
        } else {
            self.verify()
        }
    }
    
    func verify() {
        print("DEBUG: Verifying user.")
        context = LAContext()
        context.localizedCancelTitle = "Enter Username/Password"
        
        var error: NSError?
        if context
            .canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Log in to your account"
            context
                .evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                if success {
                    print("DEBUG: Sucessfully login user.")
                    DispatchQueue.main.async { [unowned self] in
                        self.state = .loggedin
                    }
                    self.navigateToPaymentVC()
                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
        }
    }
    
    func navigateToPaymentVC() {
        print("DEBUG: Navigate to payment VC!")
    }
    
    func setUI() {
        self.ui.setButtonUI(bn: self.continueButton)
    }
}
