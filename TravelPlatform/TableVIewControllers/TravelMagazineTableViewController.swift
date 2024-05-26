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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelMagazineTableViewCell", for: indexPath) as! TravelMagazineTableViewCell
        let rowData = magazineInfo.magazine[indexPath.row]
        
        cell.magazineImageView.backgroundColor = .lightGray
        cell.magazineImageView.layer.cornerRadius = 20
        
        cell.magazineTitle.text = rowData.title
        cell.magazineTitle.font = .boldSystemFont(ofSize: 20)
        
        cell.magazineSubTitle.text = rowData.subtitle
        cell.magazineSubTitle.font = .boldSystemFont(ofSize: 20)
        
        cell.magazineDescription.text = ""
        
        let date = DateFormatter.YearMonthDayOnlyNumberString.date(from: rowData.date)
        let formattedDateString = DateFormatter.YearMonthDayInKorean.string(from: date ?? Date())
        cell.magazineUploadDate.text = formattedDateString
        cell.magazineUploadDate.textColor = .lightGray
        
        return cell
    }
    
}
