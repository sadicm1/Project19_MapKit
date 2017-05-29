//
//  ViewController.swift
//  Project19
//
//  Created by Mehmet Sadıç on 28/05/2017.
//  Copyright © 2017 Mehmet Sadıç. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
  
  @IBOutlet weak var mapView: MKMapView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Define instant properties of Capital class
    let ankara = Capital(title: "Ankara", coordinate: CLLocationCoordinate2DMake(39.933, 32.86) , info: "It is the city of my student years")
    let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2DMake(48.856614, 2.352222) , info: "It is known as the city of love")
    let berlin = Capital(title: "Berlin", coordinate: CLLocationCoordinate2DMake(52.520007, 13.404954), info: "Once it was divided by a shame wall")
    let minsk = Capital(title: "Minsk", coordinate: CLLocationCoordinate2DMake(53.904540, 27.561524), info: "It is known as the city of my love")
    
    // Add new annotations to mapView
    mapView.addAnnotations([ankara, paris, berlin, minsk])
    
    // Add a right bar button item to trigger a action sheet
    // The action sheet will show map types to be selected
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(mapType))
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    // Define a reuse identifier to ensure we reuse annotation views as much as possible.
    let identifier = "Capital"
    
    // Check whether annotation we're creating a view for is one of our Capital objects
    if annotation is Capital {
      
      // Try to dequeue an annotation view from map view's unused views.
      var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
      
      // If it's not able to find a reusable one, create a new one with MKPinAnnotationView
      if annotationView == nil {
        // Create a new annotation view
        
        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        
        annotationView!.canShowCallout = true
        
        // Create a new button
        let btn = UIButton(type: .detailDisclosure)
        annotationView!.rightCalloutAccessoryView = btn
        
      } else {
        // If it can reuse a view update that view to use a different annotation.
        annotationView!.annotation = annotation
      }
      
      return annotationView
    }
    
    // If annoation isn't from a capital city it must return nil, so İOS uses a default view
    return nil
  }
  
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    let annotation = view.annotation as! Capital
      
    let cityName = annotation.title
    let cityInfo = annotation.info
    
    // Show city nama and city information with an alert
    let ac = UIAlertController(title: cityName, message: cityInfo, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default))
    present(ac, animated: true)
  }
  
  /* Function that chooses map type */
  func mapType() {
    let ac = UIAlertController(title: "Map Type", message: "Choose map type to be displayed", preferredStyle: .actionSheet)
    ac.addAction(UIAlertAction(title: "Sattelite", style: .default) { [unowned self] (alert) in
      self.mapView.mapType = .satellite
    })
    
    ac.addAction(UIAlertAction(title: "Map", style: .default) { [unowned self] (alert) in
      self.mapView.mapType = .standard
    })
    
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
    present(ac, animated: true)
  }
  
  
  
}

