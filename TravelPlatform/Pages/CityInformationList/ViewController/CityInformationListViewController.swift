//
//  CityInformationListViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/29/24.
//

import UIKit

class CityInformationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cityList = CityInfo.city {
        didSet {
            cityListTableView.reloadData()
        }
    }
    
    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var cityListTableView: UITableView!
    @IBOutlet var cityLocationSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "인기도시"
        
        setupTableView()
    }
    
    // MARK: - Setup
    
    private func setupSearchBar() {
        citySearchBar.delegate = self
    }
    
    private func setupTableView() {
        cityListTableView.rowHeight = 130
        
        cityListTableView.dataSource = self
        cityListTableView.delegate = self
        
        let cityCellXIB = UINib(nibName: CityInformationListTableViewCell.identifier, bundle: nil)
        cityListTableView.register(cityCellXIB, forCellReuseIdentifier: CityInformationListTableViewCell.identifier)
    }

    // MARK: - Method
    
    func setupFilteredList() {
        
        guard let searchText = citySearchBar.text?.lowercased() else {return}
        var resultlist : [City] = []
        
        //선택된 segment에 따라 필터링
        switch cityLocationSegmentedControl.selectedSegmentIndex {
        case 0:
            resultlist = CityInfo.city
        case 1:
            resultlist = CityInfo.city.filter{$0.domestic_travel}
        case 2:
            resultlist = CityInfo.city.filter{!$0.domestic_travel}
        default:
            break
        }
        
        //공백 검증
        if !isOnlyWhitespace(text: searchText) {
            //서치바에 작성한 검색어에 따라 필터링
            resultlist = resultlist.filter {
                $0.city_name.contains(searchText) ||
                $0.city_english_name.lowercased().contains(searchText) ||
                $0.city_explain.contains(searchText)
            }
        }
        
        cityList = resultlist
    }

    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityInformationListTableViewCell.identifier, for: indexPath) as! CityInformationListTableViewCell
        let rowData = cityList[indexPath.row]
        cell.configureData(data: rowData, searchText: citySearchBar.text)
        return cell
    }
    
    
    // MARK: - Action
    @IBAction func segmentControlSelected(_ sender: UISegmentedControl) {
        setupFilteredList()
    }
}

extension CityInformationListViewController :UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        setupFilteredList()
        citySearchBar.text = ""
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        setupFilteredList()
    }
}






