//
//  ViewController.swift
//  permanentDataStorage
//
//  Created by sunny on 26/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //UserDefaults.standard.set("Sunny", forKey: "name")
        
        let name = UserDefaults.standard.object(forKey: "name")
        
        print(name!)
        
        //Saving an array
        //let array = [1,2,3,4]
        
        //UserDefaults.standard.set(array, forKey: "array")
        
        let arrayObject = UserDefaults.standard.object(forKey: "array")
        
        if let array = arrayObject as? NSArray{
            
            print(array)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

