//
//  TravelTalkListViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/2/24.
//

import UIKit

class TravelTalkListViewController: UIViewController {
    let chatList = mockChatList
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var chatListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation(title: "TRAVEL TALK")
        
        setupUI()
        setupDelegate()
        registerXIB()

    }
    
    
    // MARK: - Setup
    
    private func setupUI() {
        searchTextField.setLeftIcon()
        searchTextField.configureDefaultTextField(placeholder: "친구 이름을 검색해보세요.")
        
        chatListTableView.rowHeight = 80
    }
    
    private func setupDelegate() {
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
    }
    
    private func registerXIB() {
        let xib = UINib(nibName:TravelTalkListTableViewCell.identifier, bundle: nil)
        chatListTableView.register(xib, forCellReuseIdentifier: TravelTalkListTableViewCell.identifier)
    }
}


extension TravelTalkListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkListTableViewCell.identifier, for: indexPath) as! TravelTalkListTableViewCell
        let rowData = chatList[indexPath.row]
        cell.setupData(data: rowData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowData = chatList[indexPath.row]
        
        let sb = UIStoryboard(name: StoryboardName.ChattingRoom, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ChattingRoomViewController.identifier) as! ChattingRoomViewController
        vc.chattingData = rowData
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
