//
//  TravelAreaDetailViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit

class TravelAreaDetailViewController: UIViewController {
    static let storyboardID = "TravelAreaDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "관광지 디테일 페이지"
    }
    
    @IBAction func popPage(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
