//
//  TravelListTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/27/24.
//

import UIKit

class TravelListTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    
    private func setupUI () {
        titleLabel.setListTitleLabel()
        
        subTitleLabel.setListSubTitleLabel()

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
    }
}
