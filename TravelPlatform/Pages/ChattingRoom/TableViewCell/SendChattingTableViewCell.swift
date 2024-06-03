//
//  SendChattingTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/3/24.
//

import UIKit

class SendChattingTableViewCell: UITableViewCell {
    @IBOutlet var chattingContentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var chattingData : Chat?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - Setup

    private func setupUI(){
        chattingContentLabel.layer.cornerRadius = 10
        chattingContentLabel.layer.borderWidth = 2
        chattingContentLabel.layer.borderColor = UIColor.lightGray.cgColor
        chattingContentLabel.numberOfLines = 0
        chattingContentLabel.backgroundColor = .systemGray5
        chattingContentLabel.layer.masksToBounds = true
//        chattingContentLabel.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func setupData(data : Chat?) {

        chattingContentLabel.text = data?.message
        dateLabel.text = formatDateString(date: data?.date ?? "")
        
        
    }
    
    
    // MARK: - Method
    
    private func formatDateString(date:String) -> String {
        let dateArray = date.components(separatedBy: " ")
        if dateArray.count > 0 {
            let timeString = date.components(separatedBy: " ")[1]
            return timeString
        }
        return ""
    }
    
}
