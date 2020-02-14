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
    
    @IBOutlet weak var tableView: UITableView!
    var items: [Item] = []
    var documents: [DocumentSnapshot] = []
    var sellerID = "Shah's Halal Food"
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DEBUG: Loading MenuViewCV")
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    func loadData(){
        let ref = db.collection("items").whereField("sellerID", isEqualTo: sellerID)
        ref.getDocuments() { querySnapshot, error in
            if let err = error {
                print("Init menu items and error occured - \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let item = Item(data: document.data())
                    item.printItem()
                    self.items.append(item)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell",for: indexPath) as! MenuTableViewCell
        cell.setItem(item: self.items[indexPath.row])
        return cell
    }
}
