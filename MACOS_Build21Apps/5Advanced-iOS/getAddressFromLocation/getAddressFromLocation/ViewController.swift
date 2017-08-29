//
//  ViewController.swift
//  getAddressFromLocation
//
//  Created by sunny on 30/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let userLocation: CLLocation = locations[0]
        
        // Geocoder map address to location coordinates
        // But we are doing reverse here
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            
            if error != nil{
                
                print(error!)
            }
            else{
                
                if let placemark = placemarks?[0]{
                
                    var thoroughFare = ""
                    var subThoroughFare = ""
                    var subLocality = ""
                    var subAdministrativeArea = ""
                    var postalCode = ""
                    var country = ""
                    
                    if placemark.thoroughfare != nil{ thoroughFare = placemark.thoroughfare! }
                    if placemark.subThoroughfare != nil{ subThoroughFare = placemark.subThoroughfare! }
                    if placemark.subLocality != nil{ subLocality = placemark.subLocality! }
                    if placemark.subAdministrativeArea != nil{ subAdministrativeArea = placemark.subAdministrativeArea! }
                    if placemark.postalCode != nil{ postalCode = placemark.postalCode! }
                    if placemark.country != nil{ country = placemark.country! }
                    
                    print("\(subThoroughFare) \(thoroughFare) \(subLocality) \(subAdministrativeArea) \(postalCode) \(country)")
                    
                    
                    
                }
            
            }
        }
        
    }

}

