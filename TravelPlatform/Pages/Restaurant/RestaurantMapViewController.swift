//
//  RestaurantMapViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 5/30/24.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
    static let storyboardID = "RestaurantMapViewController"
    var restaurantsData : [Restaurant]?
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapAnnotaion()

    }
    
    private func setupMapAnnotaion() {
        guard let restaurantsData else {return }
        var annotations : [MKAnnotation] = []
        
        for restaurant in restaurantsData {
            let locationCoordinate2D = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = locationCoordinate2D
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
}
