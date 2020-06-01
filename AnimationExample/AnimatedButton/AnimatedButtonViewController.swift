//
//  AnimatedButtonViewController.swift
//  AnimationExample
//
//  Created by Oleg Ten on 6/1/20.
//  Copyright © 2020 Oleg Ten. All rights reserved.
//

import UIKit

class AnimatedButtonViewController: UIViewController {
    
    let backgroundColor = #colorLiteral(red: 0.137254902, green: 0.1450980392, blue: 0.168627451, alpha: 1)
    let tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let strokeColor = #colorLiteral(red: 0.1647058824, green: 0.1803921569, blue: 0.2078431373, alpha: 1)
    let shadowColor = #colorLiteral(red: 0.3725490196, green: 0.3725490196, blue: 0.3725490196, alpha: 1)
    let lowerShadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    let bookButton = UIButton(type: .system)
    let neuruLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = backgroundColor
        let configuration = UIImage.SymbolConfiguration(pointSize: 22, weight: .light, scale: .medium)
        
        let offset = 4
        
        bookButton.setImage(UIImage(systemName: "book.fill", withConfiguration: configuration), for: .normal)
        bookButton.backgroundColor = backgroundColor
        bookButton.frame = CGRect(origin: view.center, size: CGSize(width: 64, height: 64))
        bookButton.center = view.center
        bookButton.tintColor = tintColor
        bookButton.layer.cornerRadius = bookButton.frame.width / 2.0
        
        bookButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        bookButton.setBackgroundColor(color: backgroundColor, forState: .normal)
        bookButton.setBackgroundColor(color: lowerShadowColor, forState: .highlighted)
        self.view.addSubview(bookButton)
       
        let path = UIBezierPath(ovalIn: bookButton.bounds)
        neuruLayer.path = path.cgPath
        neuruLayer.frame = bookButton.bounds
        neuruLayer.fillColor = UIColor.clear.cgColor
        neuruLayer.strokeColor = strokeColor.cgColor
        neuruLayer.position = bookButton.center
        neuruLayer.lineWidth = 6
        neuruLayer.lineCap = .round
        self.view.layer.insertSublayer(neuruLayer, below: bookButton.layer)
        
        let upperShadowLayer = CALayer()
        upperShadowLayer.shadowColor = shadowColor.cgColor
        upperShadowLayer.shadowOffset = CGSize(width: -offset, height: -offset)
        upperShadowLayer.shadowOpacity = 0.5
        upperShadowLayer.shadowRadius = 12
        upperShadowLayer.shadowPath = UIBezierPath(ovalIn: bookButton.bounds).cgPath
        neuruLayer.addSublayer(upperShadowLayer)
        
        let buttonShadowLayer = CALayer()
        buttonShadowLayer.shadowColor = lowerShadowColor.cgColor
        buttonShadowLayer.shadowOffset = CGSize(width: offset, height: offset)
        buttonShadowLayer.shadowOpacity = 0.5
        buttonShadowLayer.shadowRadius = 12
        buttonShadowLayer.shadowPath = UIBezierPath(ovalIn: bookButton.bounds).cgPath
        neuruLayer.addSublayer(buttonShadowLayer)
       
    }
    
   
    @objc func tap(){
      
        print("Tap button")
      
    }

}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
