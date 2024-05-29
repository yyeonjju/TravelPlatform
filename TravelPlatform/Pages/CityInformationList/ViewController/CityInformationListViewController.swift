//
//  CityInformationListViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit

class CityInformationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let storyboardID = "CityInformationListViewController"
    var cityList = CityInfo.city
    
    @IBOutlet var cityListTableView: UITableView!
    @IBOutlet var cityLocationSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기도시"
        
        setupTableView()
        setupSegmentControl()
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        cityListTableView.rowHeight = 130
        
        cityListTableView.dataSource = self
        cityListTableView.delegate = self
        
        let cityCellXIB = UINib(nibName: CityInformationListTableViewCell.cellIdentifier, bundle: nil)
        cityListTableView.register(cityCellXIB, forCellReuseIdentifier: CityInformationListTableViewCell.cellIdentifier)
    }
    
    private func setupSegmentControl() {
//        segmentTitleList.enumerated().forEach{
//            cityLocationSegmentedControl.insertSegment(withTitle: $0.element, at: $0.offset, animated: true)
//            
//            cityLocationSegmentedControl.seg
//        }
       
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
    
    // MARK: - Action

    
    @IBAction func segmentControlSelected(_ sender: UISegmentedControl) {
        
        switch cityLocationSegmentedControl.selectedSegmentIndex {
        case 0:
            cityList = CityInfo.city
        case 1:
            cityList = CityInfo.city.filter{$0.domestic_travel}
        case 2:
            cityList = CityInfo.city.filter{!$0.domestic_travel}
        default:
            break
        }
        
        cityListTableView.reloadData()
    }
    


}
