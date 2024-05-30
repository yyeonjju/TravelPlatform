//
//  CityInformationListTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit
import Kingfisher

class CityInformationListTableViewCell: UITableViewCell {
    static let cellIdentifier = "CityInformationListTableViewCell"

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var bottomCityNamesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    
    private func configureUI() {
        cityImageView.configureDefaultImageView()
        cityImageView.layer.masksToBounds = true
        
        cityNameLabel.textColor = .white
        cityNameLabel.font = .boldSystemFont(ofSize: 17)
        
        bottomCityNamesLabel.backgroundColor = .black
        bottomCityNamesLabel.alpha = 0.6
        bottomCityNamesLabel.textColor = .white
        bottomCityNamesLabel.font = .boldSystemFont(ofSize: 14)
    }
    
    func configureData(data:City) {
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        bottomCityNamesLabel.text = " \(data.city_explain)"
    }
    
}
