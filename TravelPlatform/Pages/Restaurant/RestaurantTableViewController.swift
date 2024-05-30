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
    var originalRestaurantData = RestaurantList.restaurantArray.map{
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
    lazy var restaurantTableViewList = originalRestaurantData
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchBUtton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 250
        
        setupUI()
        setupNavigation()
    }
    
    // MARK: - setup
    private func setupUI() {
        searchTextField.backgroundColor = .systemGray5
        searchTextField.placeholder = "식당을 검색하세요"
        searchTextField.layer.cornerRadius = 10
        
        
        searchBUtton.layer.cornerRadius = 10
        searchBUtton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBUtton.tintColor = .black
        searchBUtton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
    }
    
    private func setupNavigation() {
        let map = UIBarButtonItem(image: UIImage(systemName: "map.fill"), style: .plain, target: self, action: #selector(pushToRestaurantMapVC))
        map.tintColor = .black
        navigationItem.title = "캘린더"
        navigationItem.leftBarButtonItems = [map]
    }


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return restaurantTableViewList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.cellIdentifier, for: indexPath) as! RestaurantTableViewCell
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
    
    
    // MARK: - addEvent

    @objc func likeButtonTapped(sender : UIButton) {
        let index = sender.tag
        restaurantTableViewList[index].isLiked.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        
        //original리스트에도 함께 업데이트 : 검색 풀어져도 좋아요 유지될 수 있어서
        let restaurantName = restaurantTableViewList[index].name
        let originalDataIndex = originalRestaurantData.firstIndex{$0.name == restaurantName}!
        originalRestaurantData[originalDataIndex].isLiked.toggle()
    }
    
    @objc func searchButtonTapped() {
        tableView.endEditing(true)
        
        let text = searchTextField.text ?? ""
        if text.isEmpty {
            restaurantTableViewList = originalRestaurantData
        } else {
            restaurantTableViewList = restaurantTableViewList.filter{
                $0.name.contains(text) ||
                $0.address.contains(text) ||
                $0.category.contains(text)
            }
        }
        tableView.reloadData()
    }
    
    @objc func pushToRestaurantMapVC() {
        let sb = UIStoryboard(name: "RestaurantMap", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: RestaurantMapViewController.storyboardID) as! RestaurantMapViewController
        vc.restaurantsData = RestaurantList.restaurantArray
        navigationController?.pushViewController(vc, animated: true)
    }

}
