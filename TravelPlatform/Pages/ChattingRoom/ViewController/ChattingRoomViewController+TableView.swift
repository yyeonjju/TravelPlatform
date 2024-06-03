//
//  ChattingRoomViewController+TableView.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/3/24.
//

import UIKit

extension ChattingRoomViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        chattingTableView.dataSource = self
        chattingTableView.delegate = self
        
        chattingTableView.rowHeight = UITableView.automaticDimension
        
        let receiveCellXIB = UINib(nibName:ReceiveChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(receiveCellXIB, forCellReuseIdentifier: ReceiveChattingTableViewCell.identifier)
        let sendCellXIB = UINib(nibName:SendChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(sendCellXIB, forCellReuseIdentifier: SendChattingTableViewCell.identifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingData?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = chattingData?.chatList[indexPath.row]
        if rowData?.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: SendChattingTableViewCell.identifier, for: indexPath) as! SendChattingTableViewCell
            cell.setupData(data: rowData)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReceiveChattingTableViewCell.identifier, for: indexPath) as! ReceiveChattingTableViewCell
            cell.setupData(data: rowData)
            return cell
        }
        
    }
    
}
