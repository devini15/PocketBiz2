//
//  MapViewController.swift
//  PocketBiz
//
//  Created by student3 on 5/4/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    @IBOutlet weak var theMapView: MKMapView!
    
    var locationManager: CLLocationManager!
    var locationAdress: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theMapView.delegate = self
        
        let location = locationAdress
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location) { (arrayOfPlacemarks, Error) -> Void in
            for place in arrayOfPlacemarks! {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (place.location?.coordinate)!
                annotation.title = place.name
                self.theMapView.addAnnotation(annotation)
                
            }
        }
        theMapView.showsUserLocation = true
    }
    
    
}

