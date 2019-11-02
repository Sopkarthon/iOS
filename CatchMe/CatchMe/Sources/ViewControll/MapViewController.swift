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

    private var mapView: NMFMapView!
    private var markers: [NMFMarker] = []
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
        initialTempMarker()
    }
    
    private func initialNavigation() {
        self.navigationItem.title = "실시간 위치"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 27/255, green: 28/255, blue: 33/255, alpha: 0.16)
    }
    
    private func initialTempMarker() {
        let location = NMGLatLng(lat: 37.359400, lng: 127.105530)
        let location1 = NMGLatLng(lat: 37.358513, lng: 127.106613)
        let location2 = NMGLatLng(lat: 37.361293, lng: 127.107729)
        guard let ghostImage = UIImage(named: "ghost3") else { return }
        let markerImage = NMFOverlayImage(image: ghostImage)
        
        let marker = NMFMarker(position: location, iconImage: markerImage)
        marker.mapView = mapView
        
        let marker1 = NMFMarker(position: location1, iconImage: markerImage)
        marker1.mapView = mapView
        
        let marker2 = NMFMarker(position: location2, iconImage: markerImage)
        marker2.mapView = mapView
    }
    
    private func addMarker(_ marker: NMFMarker) {
        markers.append(marker)
    }
    
    private func makeMarker(latitude: CGFloat, longtitude: CGFloat) -> NMFMarker {
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: Double(latitude), lng: Double(longtitude))
        guard let ghostImage = UIImage (named: "ghost3") else { return NMFMarker() }
        marker.iconImage = NMFOverlayImage(image: ghostImage)
        marker.mapView = mapView
        return marker
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

