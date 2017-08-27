//
//  ViewController.swift
//  Whats the weather
//
//  Created by sunny on 27/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var locationTextField: UITextField!
    
    @IBOutlet var weatherWebView: UIWebView!
   
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        var location = locationTextField.text
        
        location = location?.lowercased()
        location = location?.trimmingCharacters(in: .whitespacesAndNewlines)
        location = location?.capitalized
    
        
        var nsStringLocation = NSString(string: location ?? "Delhi")
        
        
        if nsStringLocation.contains(" "){
            
            let splittedLocation = nsStringLocation.components(separatedBy: " ")
        
            var stringLocation = ""
            for location_word in splittedLocation{
                
                let capitalized_location_word = location_word.capitalized
                stringLocation += capitalized_location_word + "_"
            }
        
            stringLocation.remove(at: stringLocation.index(before: stringLocation.endIndex))
            print(stringLocation)
            nsStringLocation = NSString(string: stringLocation)
            
        }
        
        let finalUrlOfLocation = "http://www.weather-forecast.com/locations/" + String(nsStringLocation) + "/forecasts/latest"
        
        
        if let url = URL(string: finalUrlOfLocation){
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                
                
                data, response, error  in
                
                if error != nil{
                    
                    print(error!)
                    let string = "<h1>Weather of location ot available. Please try again.</h1>"
                    self.weatherWebView.loadHTMLString(string, baseURL: nil)
                    
                    
                    
                }else{
                    
                    if let unwrappedData = data{
                        
                        let dataNSString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        
                        let dataString = String(describing: dataNSString!)
                        let searchRange = dataString.startIndex..<dataString.endIndex
                        let query1 = "Day Weather Forecast Summary:"
                        let query2 = "forecast-cont"
                        let upperBound = dataString.range(of: query1, range: searchRange)!.upperBound
                        let lowerBound = dataString.range(of: query2, range: upperBound..<dataString.endIndex)!.lowerBound
                        
                        
                        let fetchedData = dataString.substring(with: upperBound..<lowerBound)
                        var strippedData = fetchedData.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                        strippedData = strippedData.replacingOccurrences(of: "<div class=", with: "", options: .regularExpression, range: nil)
                        
                        
                        
                         DispatchQueue.main.sync (
                            execute: {
                                
                                //Update the UI
                                self.weatherWebView.loadHTMLString(strippedData, baseURL: nil)
                                
                            }
                         )
                    }
                }
            }
            
            task.resume()
            
            
            
        }
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

