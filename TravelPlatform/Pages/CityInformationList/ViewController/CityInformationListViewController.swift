//
//  CityInformationListViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit

class CityInformationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let storyboardID = "CityInformationListViewController"
    let cityList = CityInfo.city
    
    @IBOutlet var cityListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기도시"
        
        setupTableView()

    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        cityListTableView.rowHeight = 130
        
        cityListTableView.dataSource = self
        cityListTableView.delegate = self
        
        let cityCellXIB = UINib(nibName: CityInformationListTableViewCell.cellIdentifier, bundle: nil)
        cityListTableView.register(cityCellXIB, forCellReuseIdentifier: CityInformationListTableViewCell.cellIdentifier)
    }
    
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityInformationListTableViewCell.cellIdentifier, for: indexPath) as! CityInformationListTableViewCell
        let rowData = cityList[indexPath.row]
        
        cell.configureData(data: rowData)
        
        return cell
    }


}
