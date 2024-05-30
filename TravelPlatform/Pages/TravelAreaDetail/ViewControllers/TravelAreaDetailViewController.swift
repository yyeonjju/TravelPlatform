//
//  TravelAreaDetailViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit
import Kingfisher

class TravelAreaDetailViewController: UIViewController {
    static let storyboardID = "TravelAreaDetailViewController"
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    
    var travelData : Travel?
    var gradeText : String {
        guard let travelData else {return "-데이터가 없습니다-"}
        return "\(travelData.title) 여행지의 별점은 \(travelData.grade ?? 0)입니다"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = travelData?.title
        
        setupUI()
        setupData()
    }
    
    // MARK: - setup
    private func setupUI() {
        titleLabel.setListTitleLabel()
        descriptionLabel.setListSubTitleLabel()
        descriptionLabel.numberOfLines = 0
        gradeLabel.numberOfLines = 0
        travelImageView.configureDefaultImageView()
    }
    
    private func setupData() {
        let url = URL(string: travelData?.travel_image ?? "")
        travelImageView.kf.setImage(with: url)
        titleLabel.text = travelData?.title
        descriptionLabel.text = travelData?.description
        gradeLabel.text = self.gradeText
    }
    
    // MARK: - Action
    @IBAction func popPage(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
