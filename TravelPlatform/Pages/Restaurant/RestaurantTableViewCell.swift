//
//  RestaurantTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/26/24.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantAddressLabel: UILabel!
    @IBOutlet var restaurantPhoneNumberLabel: UILabel!
    @IBOutlet var restaurantCategoryLabel: UILabel!
    @IBOutlet var restaurantPriceLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
