//
//  ViewController.swift
//  Maps
//
//  Created by sunny on 29/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Zoom in particular location
        let latitude: CLLocationDegrees = 27.175244
        let longitude: CLLocationDegrees = 78.0422
        
        // Zoom level
        let latDelta: CLLocationDegrees = 0.05
        
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: false)
        
        // Own Annotations
        
        let annotation = MKPointAnnotation()
        annotation.title = "Taj Mahal"
        annotation.subtitle = "A beautiful place.."
        
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        // User Long Press annotation
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    
        
        
    }
    
    func longpress(gestureRecognizer: UILongPressGestureRecognizer){
    
        // Converting data in gestureRecognizer to coordinates
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        
        annotation.subtitle = "A beautiful Place.."
        
        map.addAnnotation(annotation)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

