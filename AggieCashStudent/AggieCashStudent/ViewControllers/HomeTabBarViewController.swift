//
//  HomeTabBarViewController.swift
//  AggieCashStudent
//
//  Created by Davy Chuon on 1/30/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase


class HomeTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.fetchUserData()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchUserData() {
        let user: GIDGoogleUser = GIDSignIn.sharedInstance()!.currentUser
        let fullName = user.profile.name
        let email = user.profile.email
        if user.profile.hasImage {
            let userDP = user.profile.imageURL(withDimension: 200)
//            self.sampleImageView.sd_setImage(with: userDP, placeholderImage: UIImage(named: "default-profile"))
        } else {
//            self.sampleImageView.image = UIImage(named: "default-profile")
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
