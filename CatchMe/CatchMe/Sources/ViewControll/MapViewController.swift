//
//  ViewController.swift
//  CatchMe
//
//  Created by 남수김 on 2019/11/02.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit
import NMapsMap
import Alamofire
import CoreLocation

class MapViewController: UIViewController {

    var mapView: NMFMapView!
    private var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        initialNavigation()
    }
    
    private func initialNavigation() {
        self.navigationItem.title = "실시간 위치"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 27/255, green: 28/255, blue: 33/255, alpha: 0.16)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longtitude = location.coordinate.longitude
        print("latitude: \(latitude)")
        print("longtitude: \(longtitude)")
    }
}

