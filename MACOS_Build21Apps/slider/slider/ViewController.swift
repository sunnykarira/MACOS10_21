//
//  ViewController.swift
//  slider
//
//  Created by sunny on 26/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var slider: UISlider!

    @IBAction func slider(_ sender: UISlider) {
        
        print(slider.value)
        
        
        
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

