//
//  ViewController.swift
//  Menu Bars
//
//  Created by sunny on 24/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var timer = Timer()

    @IBAction func cameraButton(_ sender: UIBarButtonItem) {
        
        print("Camera Pressed")
        timer.invalidate()
    }
    
    func processTimer(){
    
        print("A second has passed.")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

