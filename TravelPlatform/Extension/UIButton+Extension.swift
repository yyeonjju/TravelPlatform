//
//  UIButton+Extension.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/2/24.
//

import UIKit

extension UIButton {
    func configureDefaultButton (title : String) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        self.setTitleColor(.white, for: .normal) //UIButton 스타일이 default이어야 가능
        
    }
}
