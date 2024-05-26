//
//  RestaurantTableViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/26/24.
//

import UIKit
import Kingfisher

struct RestaurantCell {
    let image : String
    let name: String
    let address: String
    let phoneNumber: String
    let category: String
    let price: Int
    var isLiked : Bool
}

class RestaurantTableViewController: UITableViewController {
    var restaurantTableViewList = RestaurantList().restaurantArray.map{
        RestaurantCell(
            image : $0.image,
            name: $0.name,
            address: $0.address,
            phoneNumber: $0.phoneNumber,
            category: $0.category,
            price: $0.price,
            isLiked : false
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 250
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return restaurantTableViewList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        let rowData = restaurantTableViewList[indexPath.row]
        
        let url = URL(string: rowData.image)
        cell.restaurantImageView.kf.setImage(with: url)
        cell.restaurantImageView.backgroundColor = .lightGray
        cell.restaurantImageView.layer.cornerRadius = 20
        cell.restaurantImageView.contentMode = .scaleAspectFill
        
        cell.restaurantNameLabel.text = "가게이름 : \(rowData.name)"
        
        cell.restaurantAddressLabel.text = "주소 : \(rowData.address)"
        
        cell.restaurantPhoneNumberLabel.text = "전화번호 : \(rowData.phoneNumber)"
        
        cell.restaurantCategoryLabel.text = "카테고리 : \(rowData.category)"
        
        cell.restaurantPriceLabel.text = "전화번호 : \(rowData.price.formatted())"
        
        [cell.restaurantNameLabel, cell.restaurantAddressLabel, cell.restaurantPhoneNumberLabel, cell.restaurantCategoryLabel, cell.restaurantPriceLabel]
            .forEach{
                $0.font = .systemFont(ofSize: 12)
            }
        
        cell.likeButton.setImage(UIImage(systemName: "heart\(rowData.isLiked ? ".fill" : "")"), for: .normal)
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.tintColor = .red
        
        return cell
    }
    
    
    @objc func likeButtonTapped(sender : UIButton) {
        let index = sender.tag
        restaurantTableViewList[index].isLiked.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        
    }

}
