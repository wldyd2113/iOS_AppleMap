//
//  MapViewController.swift
//  AppleMapApp
//
//  Created by 차지용 on 7/4/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView(frame: self.view.bounds)
        self.view.addSubview(mapView)
    }
    
}
