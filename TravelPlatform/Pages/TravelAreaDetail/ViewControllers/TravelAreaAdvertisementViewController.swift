//
//  TravelAreaAdvertisementViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit

class TravelAreaAdvertisementViewController: UIViewController {
    var advertisementComment : String?
    
    @IBOutlet var advertisementCommentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupNavigation()
        setupDate()
    }
    
    // MARK: - Configuration

    private func setupUI() {
        advertisementCommentLabel.font = FontSet.BigBoldFont
        advertisementCommentLabel.textColor = .brown
        advertisementCommentLabel.textAlignment = .center
        advertisementCommentLabel.numberOfLines = 0
    }
    
    private func setupDate() {
        advertisementCommentLabel.text = advertisementComment
    }
    
    private func setupNavigation() {
        let dismiss = UIBarButtonItem(title: "이전화면으로", style: .plain, target: self, action: #selector(dismissView))
        navigationItem.title = "이거슨 광고화면"
        navigationItem.leftBarButtonItems = [dismiss]
    }
    
    // MARK: - EventMethod

    @objc func dismissView(){
        dismiss(animated: true)
    }
}
