//
//  MenuViewController.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 1/29/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage
class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleBarlabel: UINavigationItem!

    @IBOutlet weak var tableView: UITableView!
    var items: [Item] = []
    var documents: [DocumentSnapshot] = []
    var sellerID = "Shah's Halal Food"
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Loading MenuViewCV")
        
        loadData()
    }
    func initTable() {
       tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.titleBarlabel.title = sellerID
    }
    @IBAction func bactToAllMenu(_ sender: UIBarButtonItem) {
      navigateToHome()
    }
    func navigateToHome() {
           // *Note: change "Other" to your storyboard name
           let homeViewController = UIStoryboard(name: "Other", bundle: nil)
               .instantiateViewController(withIdentifier: "HomeTabBarViewController") as? UITabBarController
           self.view.window?.rootViewController = homeViewController
           self.view.window?.makeKeyAndVisible()
       }
    func loadData(){
        let ref = db.collection("items").whereField("sellerID", isEqualTo: sellerID)
        ref.getDocuments() { querySnapshot, error in
            if let err = error {
                print("Init menu items and error occured - \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let item = Item(data: document.data())
//                    item.printItem()
                    self.items.append(item)
                }
                self.initTable()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell",for: indexPath) as! MenuTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell")
        as? MenuTableViewCell ?? MenuTableViewCell(style: .default, reuseIdentifier: "menuCell") as MenuTableViewCell
        cell.setItem(item: self.items[indexPath.row])
        self.items[indexPath.row].printItem()
        return cell
    }
}
