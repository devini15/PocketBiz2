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
        geocoder.geocodeAddressString(location + " " + location,completionHandler: { placemarks, error in
            
            if (error != nil)
            {
                print(error)
            }
            else
            {
                let currentAccounts = Accounts()
                let annotation = MKPointAnnotation()
                var coordinate = CLLocationCoordinate2D()
                
                let placemark = placemarks![0] as CLPlacemark
                coordinate = placemark.location!.coordinate
                self.locationManager.delegate = self
                self.myMapView.showsUserLocation = true
                self.myMapView.userLocation.title = self.location
                annotation.coordinate = coordinate
                annotation.title = self.location
                annotation.subtitle = self.location
                self.myMapView.addAnnotation(annotation)
                self.myMapView.setCenterCoordinate(coordinate, animated: true)
                self.locationManager.requestAlwaysAuthorization()
                self.locationManager.startUpdatingLocation()
                var span = MKCoordinateSpanMake ( 5.0, 5.0)
                let region = MKCoordinateRegionMake(coordinate, span)
                self.myMapView.setRegion(region, animated: true)
                
                
            }
            
        })
    }

}