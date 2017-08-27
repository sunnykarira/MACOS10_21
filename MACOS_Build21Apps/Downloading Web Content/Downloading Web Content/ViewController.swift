//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by sunny on 26/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let url = URL(string: "https://www.amazon.in")!
        
        //webView.loadRequest(URLRequest(url: url))
            
        //webView.loadHTMLString("<h1> Hello World</h1>", baseURL: nil)
        
        if let url = URL(string: "https://www.amazon.in"){
        
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
            
                
                data, response, error  in
                
                if error != nil{
                    
                    print(error)
                    
                }else{
                    
                    if let unwrappedData = data{
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString)
                        
                        DispatchQueue.main.sync (
                            execute: {
                                
                                //Update the UI
                            }
                        )
                    }
                }
            }
            
            task.resume()
            
            print("hsdjfhsajfhsdjfsfsfdsf")
        
        }
        
        
        
        
            
            
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

