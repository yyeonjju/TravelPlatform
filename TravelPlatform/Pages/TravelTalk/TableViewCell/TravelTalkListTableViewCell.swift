//
//  TravelTalkListTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/2/24.
//

import UIKit
import Kingfisher

class TravelTalkListTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.configureCircleImageView()
    }
    
    
    // MARK: - Setup
    
    private func setupUI() {

        nameLabel.setListTitleLabel()
        messageLabel.setListSubTitleLabel()
        dateLabel.setListSubTitleLabel()
        
        nameLabel.text = "0000"
    }
    
    func setupData(data : ChatRoom) {
        if data.chatroomImage.count > 0 {
            let image = UIImage(named: data.chatroomImage[0])
            profileImageView.image = image
        }
        nameLabel.text = data.chatroomName
        messageLabel.text = data.chatList.last?.message
        dateLabel.text = returnDateString(date: data.chatList.last?.date ?? "")
    }
    
    private func returnDateString(date : String) -> String {
        let dateArray = date.components(separatedBy: " ")
        if dateArray.count > 0 {
            let yearMonthDayString = date.components(separatedBy: " ")[0]
            
            //date로 변환
            let date = DateFormatter.yearMonthDaySeparatedByHyphen.date(from: yearMonthDayString)
            
            //원하는 string으로 변환
            guard let date else{return "-" }
            let dateString = DateFormatter.yearMonthDaySeparatedBySlash.string(from: date)
            return dateString
        }
        
        return "-"
    }



}
