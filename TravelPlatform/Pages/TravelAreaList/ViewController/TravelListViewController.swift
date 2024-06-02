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
        let TravelCellXIB = UINib(nibName: TravelListTableViewCell.identifier, bundle: nil)
        let AdvertisementCellXIB = UINib(nibName: TravelAdvertisementTableViewCell.identifier, bundle: nil)
        travelTableView.register(TravelCellXIB, forCellReuseIdentifier: TravelListTableViewCell.identifier)
        travelTableView.register(AdvertisementCellXIB, forCellReuseIdentifier: TravelAdvertisementTableViewCell.identifier)
    }
    
    
    // MARK: - tableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowData = travelList[indexPath.row]
        
        if rowData.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelAdvertisementTableViewCell.identifier, for: indexPath) as! TravelAdvertisementTableViewCell
            cell.setupData(data: rowData)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelListTableViewCell.identifier, for: indexPath) as! TravelListTableViewCell
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowData = travelList[indexPath.row]
        
        if rowData.ad {
            //광고 뷰컨 띄우기
            let sb = UIStoryboard(name: StoryboardName.TravelArea, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TravelAreaAdvertisementViewController.identifier) as! TravelAreaAdvertisementViewController
            vc.advertisementComment = rowData.title
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        }else {
            //디테일 페이지로 푸시
            let sb = UIStoryboard(name: StoryboardName.TravelArea, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TravelAreaDetailViewController.identifier) as! TravelAreaDetailViewController
            vc.travelData = rowData
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    // MARK: - addEvent

    @objc func likeButtonTapped(sender : UIButton) {
        let index = sender.tag
        travelList[index].like?.toggle()
        travelTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
}
