//
//  TravelMagazineTableViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/26/24.
//

import UIKit

class TravelMagazineTableViewController: UITableViewController {
    let magazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 515
        tableView.separatorStyle  = .none
        
        title = "Travel"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelMagazineTableViewCell.cellIdentifier, for: indexPath) as! TravelMagazineTableViewCell
        let rowData = magazineInfo.magazine[indexPath.row]
        
        cell.configureData(data: rowData)
        cell.rowNumber = indexPath.row
        
        return cell
    }
    
}
