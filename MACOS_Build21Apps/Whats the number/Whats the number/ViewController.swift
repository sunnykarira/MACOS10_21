//
//  ViewController.swift
//  Whats the number
//
//  Created by sunny on 26/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberField: UITextField!
    
    @IBAction func save(_ sender: UIButton) {
        
        if let number = numberField.text{
        
            UserDefaults.standard.set(number, forKey: "phoneNumber")
        
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let numberObject = UserDefaults.standard.object(forKey: "phoneNumber") as? String{
            
            numberField.text = numberObject
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

