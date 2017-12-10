//
//  MapViewExtension.swift
//  geoMessenger
//
//  Created by Adam Kouhel on 10/22/17.
//  Copyright © 2017 Adam Kouhel. All rights reserved.
//

import UIKit
import MapKit

extension FirstViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if let annotation = annotation as? Message {
            let identifer = "Pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifer) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            }
            else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifer)
                view.canShowCallout = true
                view.calloutOffset = CGPoint (x: -8, y:-5)
                view.pinTintColor = .green
                view.animatesDrop = true
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIButton
            }
            return view
        }
        return nil
    }
    
     func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccesoryControlTapped control: UIControl) {
        let message = view.annotation as! Message
        let placeName = message.title
        let placeInfo = message.subtitle
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title:"OK", style: .default))
        ac.addAction(UIAlertAction(title:"Remove", style: .default)) {
            (result: UIAlertAction) -> Void in mapView.removeAnnotation(message)
        }
        present(ac, animated: true)
    }
}
