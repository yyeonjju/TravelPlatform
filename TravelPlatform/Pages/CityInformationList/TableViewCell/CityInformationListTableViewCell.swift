//
//  CityInformationListTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit
import Kingfisher

class CityInformationListTableViewCell: UITableViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var bottomCityNamesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: - setup
    
    private func configureUI() {
        cityImageView.configureDefaultImageView()
        cityImageView.addSubview(bottomCityNamesLabel)
        cityImageView.clipsToBounds = true
        
        cityNameLabel.textColor = .white
        cityNameLabel.font = .boldSystemFont(ofSize: 17)
        
        bottomCityNamesLabel.backgroundColor = .black
        bottomCityNamesLabel.alpha = 0.6
        bottomCityNamesLabel.textColor = .white
        bottomCityNamesLabel.font = .boldSystemFont(ofSize: 14)
    }
    
    func configureData(data:City, searchText : String?) {
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        bottomCityNamesLabel.text = " \(data.city_explain)"
        
        [cityNameLabel, bottomCityNamesLabel]
            .forEach{
                changeSpecificTextColor(searchText: searchText, uiLabel: $0)
            }
    }
}


