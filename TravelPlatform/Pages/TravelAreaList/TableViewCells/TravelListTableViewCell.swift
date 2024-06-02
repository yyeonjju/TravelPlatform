//
//  TravelListTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/27/24.
//

import UIKit
import Cosmos

class TravelListTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var saveNumberLabel: UILabel!
    @IBOutlet var cosmosStarRateView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    
    private func setupUI () {
        titleLabel.setListTitleLabel()
        
        subTitleLabel.setListSubTitleLabel()
        gradeLabel.setListSubTitleLabel()
        saveNumberLabel.setListSubTitleLabel()

        mainImageView.backgroundColor = .lightGray
        mainImageView.layer.cornerRadius = 10
        mainImageView.contentMode = .scaleAspectFill
        
        likeButton.tintColor = .red
    }
    
    func setupData (data : Travel) {
        titleLabel.text = data.title
        subTitleLabel.text = data.description
        let url = URL(string: data.travel_image ?? "")
        mainImageView.kf.setImage(with: url)
        likeButton.setImage(UIImage(systemName: "heart\(data.like == true ? ".fill" : "")"), for: .normal)
        gradeLabel.text = "별점 (\(data.grade ?? 0))"
        saveNumberLabel.text = "저장 \(data.save?.formatted() ?? "-" )"
        
        cosmosStarRateView.rating = data.grade ?? 0
        cosmosStarRateView.text = "(\(data.grade ?? 0))"
        cosmosStarRateView.settings.fillMode = .precise
        cosmosStarRateView.settings.starMargin = 2
        
    }
}
