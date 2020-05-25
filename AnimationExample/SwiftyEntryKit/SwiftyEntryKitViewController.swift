//
//  SwiftyEntryKitViewController.swift
//  AnimationExample
//
//  Created by Oleg Ten on 5/25/20.
//  Copyright © 2020 Oleg Ten. All rights reserved.
//

import UIKit
import SwiftEntryKit

class SwiftyEntryKitViewController: UIViewController {
    
    @IBOutlet weak var alert1Button: UIButton!
    @IBOutlet weak var alert1Button1: UIButton!
    @IBOutlet weak var alert1Button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func setupEKAttributes() -> EKAttributes{
        
       
        var attributtes = EKAttributes()
        
        //Type of show alert - from buttom to up
        attributtes.position = .bottom
        
        //Time of appearing view infinity(default 2 sec)
        attributtes.displayDuration = 4//.infinity
        
        //background color of Parent Controller
        attributtes.screenBackground = .color(color: .init(light: UIColor(white: 100.0/255.0, alpha: 0.3), dark: UIColor(white: 50.0/255.0, alpha: 0.3)))
        
        //setup shadow
        attributtes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 8))
        
        //action after click anywhere on screen - dissmis alert
        attributtes.screenInteraction = .dismiss
        
        //action after click anywhere on view alert - nothing happend
        attributtes.entryInteraction = .absorbTouches
       
        //custom action by tap on alert
        let action = {
            print("tap on alert")
        }
        attributtes.entryInteraction.customTapActions.append(action)
        
        //Type of scrolling
        attributtes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        
        //animation appear
//        attributtes.entranceAnimation = .init(
//            translate: .init(
//                duration: 0.7,
//                spring: .init(damping: 1,initialVelocity: 0)),
//
//            scale: .init(
//                from: 1.05,
//                to: 1,
//                duration: 0.4,
//                spring: .init(
//                    damping: 1,
//                    initialVelocity: 0)))
//

        //offset from bottom (safeArea)
        attributtes.positionConstraints.verticalOffset = 0
        
        //color of statusBar while appear view Alert
        attributtes.statusBar = .currentStatusBar
        
        
        //width of view
        let widthConstraint = EKAttributes.PositionConstraints.Edge.ratio(value: 0.9)
        let heightConstraint = EKAttributes.PositionConstraints.Edge.intrinsic
        attributtes.positionConstraints.size = .init(width: widthConstraint, height: heightConstraint)
        
//        attributtes.positionConstraints.safeArea = .empty(fillSafeArea: false)
        
        return attributtes
    }
    
    @IBAction func alertTapButton(_ sender: Any) {
   
        SwiftEntryKit.display(entry: PopUpView(), using: setupEKAttributes())
    }
    
  
    @IBAction func alertTapButton1(_ sender: Any) {
        
        
      
    }
    @IBAction func alertTapButton2(_ sender: Any) {
      
    }
    
    
}
