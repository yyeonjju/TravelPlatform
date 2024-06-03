//
//  ReceiveChattingTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/3/24.
//

import UIKit
import Kingfisher

class ReceiveChattingTableViewCell: UITableViewCell {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chattingContentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    var chattingData : Chat?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.configureCircleImageView()
        
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
//        chattingContentLabel.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func setupData(data : Chat?) {
        profileImageView.image = UIImage(named: data?.user.rawValue ?? "")
        
        nameLabel.text = data?.user.rawValue ?? ""
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
