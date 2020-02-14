//
//  VendorViewController.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 1/29/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit

class VendorViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataArray = ["Shah's Halal Food", "Kado's Asian Grill", "Go Fusion", "Nash & Proper", "Authentic Mexican Food"]
    
    var estimateWidth = 160.0
    var cellMarginSize = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //Register Cells
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        //Setup Grid View
        self.setupGridView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
}

extension VendorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(text: self.dataArray[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Other", bundle: nil)
        let vs = storyboard.instantiateViewController(identifier: "MenuViewController")
        let menu = vs as! MenuViewController
//        menu.modalPresentationStyle = .fullScreen
        self.definesPresentationContext = true
        menu.modalPresentationStyle = .overCurrentContext
        menu.sellerID = self.dataArray[indexPath.row]
        self.present(menu, animated: true, completion: nil)
        
        print(self.dataArray[indexPath.row])
    }
}

extension VendorViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    }
}
