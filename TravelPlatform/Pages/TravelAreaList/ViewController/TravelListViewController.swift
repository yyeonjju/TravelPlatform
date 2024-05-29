//
//  TravelListViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/27/24.
//

import UIKit

class TravelListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var travelList = TravelInfo().travel

    @IBOutlet var travelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "도시 상세 정보"

        travelTableView.dataSource = self
        travelTableView.delegate = self
        
        registerXIB()
    }
    
    // MARK: - registerXIB
    private func registerXIB() {
        let TravelCellXIB = UINib(nibName: TravelListTableViewCell.cellIdentifier, bundle: nil)
        let AdvertisementCellXIB = UINib(nibName: TravelAdvertisementTableViewCell.cellIdentifier, bundle: nil)
        travelTableView.register(TravelCellXIB, forCellReuseIdentifier: TravelListTableViewCell.cellIdentifier)
        travelTableView.register(AdvertisementCellXIB, forCellReuseIdentifier: TravelAdvertisementTableViewCell.cellIdentifier)
    }
    
    
    // MARK: - tableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath.row)
        
        let rowData = travelList[indexPath.row]
        
        if rowData.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelAdvertisementTableViewCell.cellIdentifier, for: indexPath) as! TravelAdvertisementTableViewCell
            cell.setupData(data: rowData)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelListTableViewCell.cellIdentifier, for: indexPath) as! TravelListTableViewCell
            cell.setupData(data: rowData)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowData = travelList[indexPath.row]
        if rowData.ad {
            return 130
        } else {
            return 230
        }
    }
    
    // MARK: - addEvent

    @objc func likeButtonTapped(sender : UIButton) {
        let index = sender.tag
        travelList[index].like?.toggle()
        travelTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
}
