//
//  UIcontroller.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 01/29/19.
//

import UIKit
import Foundation

class UIcontroller {
    
    let IMAGE_MAX: Int64 =  1 * 1024 * 1024
    
    func setNavigationBarUI(on vc: UIViewController) {
        let nvBar = vc.navigationController?.navigationBar
        nvBar?.barStyle = .default
        nvBar?.tintColor = UIColor.init(displayP3Red: 0.22, green: 0.50, blue: 0.54, alpha: 1.0)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "aggie-logo")
        imageView.image = image
        vc.navigationItem.titleView = imageView
    }
    
    func setButtonUI(bn: UIButton) {
        // Text
        bn.titleLabel?.font = .systemFont(ofSize: 18)
        //bn.setTitleColor(UIColor.init(displayP3Red: 1, green: 0.85, blue: 0, alpha: 1.0), for: .normal)
        // Layout
        bn.frame = CGRect(x: 100, y: 100, width: 300, height: 40)
        bn.layer.cornerRadius = bn.frame.height / 2
        //bn.backgroundColor = UIColor.init(displayP3Red: 0.22, green: 0.50, blue: 0.54, alpha: 1)
        // Shadow
        bn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        bn.layer.shadowOffset = CGSize(width: 0, height: 3)
        bn.layer.shadowOpacity = 1.0
        bn.layer.shadowRadius = 2.0
        bn.layer.masksToBounds = false
    }
    
    func setTextFieldUI(tf: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: tf.frame.height - 1, width: tf.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        //UIColor.init(displayP3Red: 0.22, green: 0.50, blue: 0.54, alpha: 1.0).cgColor
        tf.borderStyle = UITextField.BorderStyle.none
        tf.layer.addSublayer(bottomLine)
    }
    
    func setCircularView(view: UIImageView) {
        view.layer.borderWidth = 1
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
    }
    
    func setRoundEdgeCell(view: UIImageView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10.0
        //view.layer.shadowColor
    }
    
    func resized(view: UIImageView, targetSize: CGSize) -> UIImage? {
        var resizedImage: UIImage?
        
        if let image = view.image {
            let size = image.size
            let widthRatio = targetSize.width / size.width
            let heightRatio = targetSize.height / size.height
            
            print(image.size)
            var canvas: CGSize
            if widthRatio > heightRatio {
                canvas = CGSize(width: image.size.width * heightRatio,
                                height: image.size.height * heightRatio)
            } else {
                canvas = CGSize(width: image.size.width * widthRatio,
                                height: image.size.height * widthRatio)
            }
            let rect = CGRect(x: 0, y: 0, width: canvas.width, height: canvas.height)
            print("canvas", canvas)
            UIGraphicsBeginImageContextWithOptions(canvas, false, 1.0)
            image.draw(in: rect)
            resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
        } else {
            print("Nil image.")
        }
        return resizedImage
    }
    
    func setTableActicityIndicator(tv: UITableView, isTop: Bool) {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        spinner.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            spinner.stopAnimating()
            spinner.isHidden = true
        }
        spinner.frame = CGRect(x: 0, y: 0, width: tv.frame.width, height: 44)
        if (isTop) {
            tv.tableHeaderView = spinner
        } else {
            tv.tableFooterView = spinner
        }
    }
    
    // Keyboard Dismission
    func setKeyboardDismiss(on vc: UIViewController) {
        let tap = UITapGestureRecognizer(target: vc.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        vc.view.addGestureRecognizer(tap)
    }
}

