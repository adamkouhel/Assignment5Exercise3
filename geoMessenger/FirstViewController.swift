//
//  FirstViewController.swift
//  geoMessenger
//
//  Created by Adam Kouhel on 10/22/17.
//  Copyright © 2017 Adam Kouhel. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set initial location to Marquette University
        let initialLocation = CLLocation(latitude: 43.039011, longitude: -87.929752)
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        
        // show messages on Map
        let message = Message(title: "The Bucks are legit!", locationName: "Bradley Center", username: "John Smith", coordinate: CLLocationCoordinate2D(latitude: 43.043832, longitude: -87.917238), isDisabled: true)
        
        mapView.addAnnotation(message)
    }

    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    

}

