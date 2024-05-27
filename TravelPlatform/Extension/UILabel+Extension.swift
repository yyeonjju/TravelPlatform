//
//  UILabel+Extension.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/27/24.
//

import UIKit


extension UILabel {
    func setListTitleLabel () {
        self.font = .boldSystemFont(ofSize: 17)
        self.textAlignment = .left
    }
    
    func setListSubTitleLabel () {
        self.font = .boldSystemFont(ofSize: 13)
        self.textAlignment = .left
        self.textColor = .lightGray
    }
    
    func setAdvertisementLabel () {
        self.numberOfLines = 0
        self.font = .boldSystemFont(ofSize: 21)
        self.textAlignment = .center
        self.textColor = .black
    }
    
    func setAdvertisementTagLabel () {
        self.text = "AD"
        self.font = .boldSystemFont(ofSize: 13)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.textAlignment = .center
        self.textColor = .gray
    }
}



