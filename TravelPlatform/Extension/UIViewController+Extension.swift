//
//  UIViewController+Extension.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/2/24.
//

import UIKit


extension UIViewController {
    
    func configureNavigation(title : String) {
        self.navigationItem.title = title
    }
}


// 키보드 숨기기
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
