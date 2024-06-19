//
//  RestaurantMapViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/30/24.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
    var restaurantsData : [Restaurant]?
    var mapdRestaurantData : [Restaurant] = [] {
        didSet {
            setupMapAnnotaion()
        }
    }
    
    //⭐️ 위치 매니저 생성
    let locationManager = CLLocationManager()

    @IBOutlet var categoryAlertButton: UIButton!
    @IBOutlet var entireRestaurantButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let restaurantsData else {return }
        mapdRestaurantData = restaurantsData
        
        setupUI()
        setupTarget()
        
        //⭐️클래스와 프로토콜 연결
       locationManager.delegate = self

    }
    
    // MARK: - Setup

    private func setupUI() {
        categoryAlertButton.configureDefaultButton(title: "카테고리별 찾기")
        entireRestaurantButton.configureDefaultButton(title: "전체보기")
    }
    
    private func setupTarget() {
        categoryAlertButton.addTarget(self, action: #selector(categoryAlertButtonTapped), for: .touchUpInside)
        entireRestaurantButton.addTarget(self, action: #selector(entireRestaurantButtonTapped), for: .touchUpInside)
    }
    
    private func setupMapAnnotaion() {
        //이전에 추가되어있던 어노테이션 제거
        let prevAnnotations = mapView.annotations
        mapView.removeAnnotations(prevAnnotations)
        
        //mapdRestaurantData 기반으로 새로운 어노테이션 추가
        var annotations : [MKAnnotation] = []
        for restaurant in mapdRestaurantData {
            let locationCoordinate2D = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = locationCoordinate2D
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
    
    // MARK: - Target
    @objc func categoryAlertButtonTapped() {
        //1. 얼럿 컨트롤러
        let alert = UIAlertController(title: "프로필설정", message: nil, preferredStyle: .actionSheet)
        
        //2. 버튼
        let koreanFood = UIAlertAction(title: "한식만 보기", style: .default){ _ in
            self.setupFilteredRestaurantList(keyword: RestaurantCategoryKeyword.koreanFood)
        }
        let chineseFood = UIAlertAction(title: "중식만 보기", style: .default){ _ in
            self.setupFilteredRestaurantList(keyword: RestaurantCategoryKeyword.chineseFood)
        }
        let japaneseFood = UIAlertAction(title: "일식만 보기", style: .default){ _ in
            self.setupFilteredRestaurantList(keyword: RestaurantCategoryKeyword.japaneseFood)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        //3. 액션 버튼 붙이기 (addAction 한 순서대로
        alert.addAction(koreanFood)
        alert.addAction(chineseFood)
        alert.addAction(japaneseFood)
        alert.addAction(cancel)
        
        //4. 얼럿 띄워주기
        present(alert, animated: true)
    }
    
    @objc func entireRestaurantButtonTapped() {
        guard let restaurantsData else{return }
        mapdRestaurantData = restaurantsData
    }
    
    
    // MARK: - Method
    
    private func setupFilteredRestaurantList(keyword : String) {
        guard let restaurantsData else{return }
        mapdRestaurantData = restaurantsData.filter{
            $0.category == keyword
        }
    }

    
    
    
}
