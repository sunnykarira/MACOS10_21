//
//  ViewController.swift
//  catYears
//
//  Created by sunny on 22/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var yearsTextField: UITextField!
    
    @IBOutlet var catYearsLabel: UILabel!
    
    var userInMiddleOfTyping = false
    
    @IBAction func submitYears(_ sender: UIButton) {
        
        userInMiddleOfTyping = true
        if let years = Double(yearsTextField.text!){
            
            catYearsLabel.text = String(years * 7)
            userInMiddleOfTyping = false
        }
        
        if !userInMiddleOfTyping{
            yearsTextField.text = ""
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

