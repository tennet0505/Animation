//
//  MATERIALioViewController.swift
//  AnimationExample
//
//  Created by Oleg Ten on 5/25/20.
//  Copyright © 2020 Oleg Ten. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBanner

class MATERIALioViewController: UIViewController {
    
    
    
    let bannerView = MDCBannerView()

    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    func setBanner() {
       
//        bannerView.bannerViewLayoutStyle = .automatic
        
        bannerView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        bannerView.showsDivider = true
        bannerView.dividerColor  = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        bannerView.textView.text = "Text on Banner"
        
        bannerView.imageView.image = UIImage(named: "logo")
        
        bannerView.leadingButton.setTitle("Close", for: .normal)
        bannerView.leadingButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        bannerView.leadingButton.isHidden = false
        bannerView.leadingButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        bannerView.trailingButton.setTitle("Second", for: .normal)
        bannerView.trailingButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        bannerView.trailingButton.isHidden = false

        // Optional configuration on layoutMargins
        bannerView.layoutMargins = UIEdgeInsets(top: 40, left: 10, bottom: 0, right: 10);

        let bannerViewSize = bannerView.sizeThatFits(view.bounds.size)
        bannerView.frame = CGRect(x: 0, y: 0, width: bannerViewSize.width, height: bannerViewSize.height + 112)

        self.view.addSubview(self.bannerView)
       
        
    }
    
    @objc func tapButton(){
        print("TapButton")
        bannerView.removeFromSuperview()
    }

    @IBAction func showBannerButton(_ sender: Any) {
     
        setBanner()
    }
    
}
