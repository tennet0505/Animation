//
//  PopUpView.swift
//  AnimationExample
//
//  Created by Oleg Ten on 5/25/20.
//  Copyright © 2020 Oleg Ten. All rights reserved.
//

import UIKit

class PopUpView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.layer.cornerRadius = 20
        let button: UIButton = {
            let button = UIButton()
            button.setTitle("Button Name", for: .normal)
            button.addTarget(self, action: #selector(TapMe), for: .touchUpInside)
            button.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
            button.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
            button.layer.cornerRadius = 5
            return button
        }()
        
        self.addSubview(button)
        button.centerInSuperview()
        
    }
    @objc func TapMe(){
        print("Tapme")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
