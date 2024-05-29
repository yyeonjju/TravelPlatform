//
//  TravelAreaAdvertisementViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit

class TravelAreaAdvertisementViewController: UIViewController {
    
    static let storyboardID = "TravelAreaAdvertisementViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavigation()
    }
    
    // MARK: - Configuration

    private func configureUI() {

    }
    
    private func configureNavigation() {
        let dismiss = UIBarButtonItem(title: "이전화면으로", style: .plain, target: self, action: #selector(dismissView))
        navigationItem.title = "이거슨 광고화면"
        navigationItem.leftBarButtonItems = [dismiss]
    }
    
    // MARK: - EventMethod

    @objc func dismissView(){
        dismiss(animated: true)
    }
}
