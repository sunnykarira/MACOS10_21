//
//  ViewController.swift
//  guessthefingers
//
//  Created by sunny on 23/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var textField: UITextField!

    @IBOutlet var labelAnswer: UILabel!
    
    
    @IBAction func guessButton(_ sender: UIButton) {
        
        if let textFieldText = textField.text{
            
            if Int(textFieldText)! <= 0 || Int(textFieldText)! >= 5{
                
                labelAnswer.text = "Please enter number between 0 and 5"
                return
            }
            
            let randomNumber = Int(arc4random_uniform(6))
            let intTextFieldtext = Int(textFieldText)
            
            if randomNumber == intTextFieldtext!{
                
                labelAnswer.text = "You are right \(randomNumber)"
                
            }else{
                
                labelAnswer.text = "You are wrong \(randomNumber)"
            }
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

