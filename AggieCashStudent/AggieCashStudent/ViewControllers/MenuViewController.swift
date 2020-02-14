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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell",for: indexPath) as! MenuTableViewCell
        let restaurant = items[indexPath.row]
        print(indexPath.row)
        print(restaurant)
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    private var items: [Item] = []
    private var documents: [DocumentSnapshot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    func loadData(){
        let ref = Firestore.firestore().collection("VendorMenu").document()
               ref.getDocument { document, error in
                   if let err = error {
                       print("\(err)")
                   }
                   if let data = document {
//                       let ownerName = data.get("accName") as! String
//                       let ownerImageName = data.get("imageName") as! String
                       // init local variables
                    print(data.documentID)

                   }
               }
    }
}
