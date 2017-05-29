//
//  Capital.swift
//  Project19
//
//  Created by Mehmet Sadıç on 28/05/2017.
//  Copyright © 2017 Mehmet Sadıç. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
  
  let title: String?
  let coordinate: CLLocationCoordinate2D
  let info: String
  let favorite: String?
  
  init(title: String, coordinate: CLLocationCoordinate2D, info: String, favorite: String?) {
    self.title = title
    self.coordinate = coordinate
    self.info = info
    self.favorite = favorite
  }

}
