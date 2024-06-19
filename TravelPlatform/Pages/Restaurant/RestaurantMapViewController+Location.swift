//
//  RestaurantMapViewController+Location.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/19/24.
//

import UIKit
import CoreLocation
import MapKit

extension RestaurantMapViewController {
    //⭐️iOS 위치 서비스 활성화 여부 체크
    func checkDeviceLocationAuthorization () {
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorization()
        }else {
            print("위치 서비스 사용할 수 없음 -> iOS 설정으로 가도록")
            showAlert()
        }
    }
    
    
    //⭐️ 현재 사용자 위치 권한 상태 확인
    func checkCurrentLocationAuthorization () {
        var status : CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        }else {
            status = CLLocationManager.authorizationStatus()
        }
    
        
        switch status {
        case .notDetermined:
            print("notDetermined")
            // 업데이트 주기 설정
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            print("denied - 권한 거부하면 다른 곳 띄워주기")
            setRegionCoordinator(center: CLLocationCoordinate2D(latitude: 37.517597, longitude: 126.887247))
            
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation() //->didUpdateLocations을 불러준다
        default :
            print(status)
        }
    }
    
    
    func setRegionCoordinator(center : CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.setRegion(region, animated: true)
    }
    
    func showAlert() {
        let altert = UIAlertController(title: "위치 사용 허용하러 가기", message: nil, preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "확인", style: .default) { _ in
            self.goToLocationSettings()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        altert.addAction(confirm)
        altert.addAction(cancel)
        
        present(altert, animated: true)
    }
    
    func goToLocationSettings() {
        if let BUNDLE_IDENTIFIER = Bundle.main.bundleIdentifier,
            let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(BUNDLE_IDENTIFIER)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
}

//⭐️ 위치 관련 프로토콜 선언
extension RestaurantMapViewController : CLLocationManagerDelegate{

    //⭐️사용자 위치를 성공적으로 가지고 온 경우
    //여러번 호출될 수 있다 -> stopUpdatingLocation() 호출 필요
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //locations가 배열로 있다
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            print(coordinate.latitude)
            print(coordinate.longitude)
            
            setRegionCoordinator(center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))

        }
    
        locationManager.stopUpdatingLocation()
        
    }
    
    //⭐️ 사용자의 위치를 가지고 오지 못했을 때
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(#function)
    }
    
    //⭐️ 사용자의 권한 상태가 변경이 될 때 + 앱 다시 시작할 때(인스턴스 재생성될 때)에도 실행이 된다.
    //📌 iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        //기기의 위치 서비스 허용 여부부터 다시 확인 시작한다
        checkDeviceLocationAuthorization()
        
    }
    //📌 iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
        //기기의 위치 서비스 허용 여부부터 다시 확인 시작한다
        checkDeviceLocationAuthorization()
    }
}
