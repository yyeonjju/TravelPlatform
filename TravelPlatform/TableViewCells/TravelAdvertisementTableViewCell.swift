//
//  TravelAdvertisementTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/27/24.
//

import UIKit

class TravelAdvertisementTableViewCell: UITableViewCell {
    let colorArray : [UIColor] = [.blue, .systemPink, .systemCyan, .systemMint, .systemBrown]
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var advertisementLabel: UILabel!
    @IBOutlet var adTagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI () {
        advertisementLabel.setAdvertisementLabel()
        adTagLabel.setAdvertisementTagLabel()
        
        cellBackgroundView.layer.cornerRadius = 10
        cellBackgroundView.backgroundColor = colorArray.randomElement()
        
    }
    
    func setupData(data : Travel) {
        advertisementLabel.text = data.title
    }

    
}
