//
//  ViewController.swift
//  Places to visit (Memorable Places)
//
//  Created by sunny on 30/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet var map: MKMapView!
    let defaults = UserDefaults.standard
    let latitudeArray = [String]()
    let longitudeArray = [String]()
    let placesToVisit = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let uilpgr = UILongPressGestureRecognizer(target : self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 1
        map.addGestureRecognizer(uilpgr)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let latitudeArray = self.defaults.object(forKey: "latitudeArray") as? [String] ?? [String]()
        let longitudeArray = self.defaults.object(forKey: "longitudeArray") as? [String] ?? [String]()
        let placesToVisit = self.defaults.object(forKey: "placesToVisit") as? [String] ?? [String]()
        

        for (index, _) in latitudeArray.enumerated(){
            
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: Double((latitudeArray[index] as NSString).doubleValue), longitude: Double((longitudeArray[index] as NSString).doubleValue))
            annotation.title = placesToVisit[index]
            annotation.coordinate = coordinate
            map.addAnnotation(annotation)
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func longpress(gestureRecognizer: UILongPressGestureRecognizer){
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let touchCoordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let location = CLLocation(latitude: touchCoordinate.latitude, longitude: touchCoordinate.longitude)
        
        CLGeocoder().reverseGeocodeLocation(location){ (placemark, error) in
            
            if error != nil{
                
                print(error!)
                
            }else{
                
                if let placemark = placemark?[0]{
                    
                    var subLocality = ""
                    var subAdministrativeArea = ""
                    var country = ""
                    
                    if placemark.subLocality != nil{ subLocality = placemark.subLocality! }
                    if placemark.subAdministrativeArea != nil{ subAdministrativeArea = placemark.subAdministrativeArea! }
                    if placemark.country != nil{ country = placemark.country! }
                    
                    let string = "\(subLocality) \(subAdministrativeArea) \(country)"
                    
                    var latitudeArray = self.defaults.object(forKey: "latitudeArray") as? [String] ?? [String]()
                    var longitudeArray = self.defaults.object(forKey: "longitudeArray") as? [String] ?? [String]()
                    var placesToVisit = self.defaults.object(forKey: "placesToVisit") as? [String] ?? [String]()
                    
                    latitudeArray.append(String(touchCoordinate.latitude))
                    longitudeArray.append(String(touchCoordinate.longitude))
                    placesToVisit.append(string)
                    
                    self.defaults.set(latitudeArray, forKey: "latitudeArray")
                    self.defaults.set(longitudeArray, forKey: "longitudeArray")
                    self.defaults.set(placesToVisit, forKey: "placesToVisit")
                }
            
            }
            
        }
        
        performSegue(withIdentifier: "toNavigationViewController", sender: nil)
    }


}

