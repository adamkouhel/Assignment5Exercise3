//
//  Message.swift
//  geoMessenger
//
//  Created by Adam Kouhel on 10/22/17.
//  Copyright © 2017 Adam Kouhel. All rights reserved.
//

import UIKit
import MapKit

class Message: NSObject, MKAnnotation {

    let title: String?
    let locationName: String
    let username: String
    let coordinate: CLLocationCoordinate2D
    let isDisabled: Bool
    
    init(title: String, locationName: String, username: String, coordinate: CLLocationCoordinate2D, isDisabled: Bool) {
    self.title = title
    self.locationName = locationName
    self.username = username
    self.coordinate = coordinate
    self.isDisabled = isDisabled
    
    super.init()
}
    
}
