//
//  ViewController.swift
//  CatchMe
//
//  Created by 남수김 on 2019/11/02.
//  Copyright © 2019 ns. All rights reserved.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {
    
    var mapView: NMFMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
    }
    
    
}

