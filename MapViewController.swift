//
//  MapViewController.swift
//  PocketBiz
//
//  Created by student3 on 5/4/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    var location = ""
    var name = ""
    let geocoder = CLGeocoder()
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 }

}