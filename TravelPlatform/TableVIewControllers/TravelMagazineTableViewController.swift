//
//  TravelMagazineTableViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelMagazineTableViewController: UITableViewController {
    let magazineInfo = MagazineInfo()
    let imageManager = ImageManager()
    
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
        
        /// [1] Kingfisher 사용
        let url = URL(string: rowData.photo_image)
        cell.magazineImageView.kf.setImage(with: url)
        
        /// [2] 이미지 다운로드해서 swift 자체 기능으로 구현
//        if let url = URL(string: rowData.photo_image) {
//            imageManager.downloadImage(from: url){data in 
//                //참조 타입 안에 있는 함수이고 클래스와 클로저가 강한 순환 참조될 수도 있으므로 weak 캡처리스트? [weak cell]
//                //⭐️ always update the UI from the main thread
//                DispatchQueue.main.async() { [weak cell] in
//                    cell?.magazineImageView.image = UIImage(data: data)
//                }
//            }
//        }

        cell.magazineImageView.backgroundColor = .lightGray
        cell.magazineImageView.layer.cornerRadius = 20
        cell.magazineImageView.contentMode = .scaleAspectFill
        
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
