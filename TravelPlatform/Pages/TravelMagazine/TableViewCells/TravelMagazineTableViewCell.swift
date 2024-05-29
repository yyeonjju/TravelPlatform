//
//  TravelMagazineTableViewCell.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/26/24.
//

import UIKit
import Kingfisher

class TravelMagazineTableViewCell: UITableViewCell {

    static let cellIdentifier = "TravelMagazineTableViewCell"
    let imageManager = ImageManager()
    var rowNumber = 0
    
    @IBOutlet var magazineImageView: UIImageView!
    @IBOutlet var magazineTitle: UILabel!
    @IBOutlet var magazineSubTitle: UILabel!
    @IBOutlet var magazineDescription: UILabel!
    @IBOutlet var magazineUploadDate: UILabel!
    
    
    //100퍼센트 모든 경우의수 처리해주지 않아도 
    //셀 재사용할 때 남아있는 디자인 같은거 있으면여기서 계속 제거해줄 수 있다.
    override func prepareForReuse() {
        super.prepareForReuse()
        magazineImageView.layer.cornerRadius = 20
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //이렇게만 하면 이전에 남은 디자인이 적용될 때도 있으므로 prepareForReuse에서 초기화 시켜주는 코드도 추가
        if rowNumber%2 == 0 {//짝수행일 때 이미지뷰 원으로 만들기
            magazineImageView.layer.cornerRadius = magazineImageView.frame.width/2
        }

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
        //awakeFromNib에서 디자인 작업해주면 셀 만들때마다 디자인 계속 새로 작업해주지 않아도됨
    }
    
    private func configureUI () {
        magazineImageView.backgroundColor = .lightGray
        magazineImageView.layer.cornerRadius = 20
        magazineImageView.contentMode = .scaleAspectFill
        magazineTitle.font = .boldSystemFont(ofSize: 20)
        magazineSubTitle.font = .boldSystemFont(ofSize: 20)
        magazineDescription.text = ""
        magazineUploadDate.textColor = .lightGray
    }
    
    func configureData(data : Magazine) {
        /// [1] Kingfisher 사용
        let url = URL(string: data.photo_image)
        magazineImageView.kf.setImage(with: url)
        
        /// [2] 이미지 다운로드해서 swift 자체 기능으로 구현
//        if let url = URL(string: data.photo_image) {
//            imageManager.downloadImage(from: url){imageData in
//                //참조 타입 안에 있는 함수이고 클래스와 클로저가 강한 순환 참조될 수도 있으므로 weak 캡처리스트? [weak cell]
//                //⭐️ always update the UI from the main thread
//                DispatchQueue.main.async() { [weak self] in
//                    guard let self else {return}
//                    self.magazineImageView.image = UIImage(data: imageData)
//                }
//            }
//        }
        
        magazineTitle.text = data.title
        magazineSubTitle.text = data.subtitle
        
        let date = DateFormatter.YearMonthDayOnlyNumberString.date(from: data.date)
        let formattedDateString = DateFormatter.YearMonthDayInKorean.string(from: date ?? Date())
        magazineUploadDate.text = formattedDateString
    }


}
