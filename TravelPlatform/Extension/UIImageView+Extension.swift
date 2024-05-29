//
//  UIImageView+Extension.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit

extension UIImageView {
    
    func configureDefaultImageView() {
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        self.contentMode = .scaleAspectFill
    }
    
}
