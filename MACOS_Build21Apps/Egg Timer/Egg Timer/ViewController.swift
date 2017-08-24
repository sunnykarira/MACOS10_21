//
//  ViewController.swift
//  Egg Timer
//
//  Created by sunny on 25/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet var timerLabel: UILabel!
    
    
    var count: Int {
        get {
            return Int(timerLabel.text!)!
        }
        set(newCount){
    
            timerLabel.text = String(newCount)
        }
    }
    
    
    func processFunction(){
        
        if(count > 0){
            count -= 1
        }else{
            
            timer.invalidate()

        }
    }
    
    
    @IBAction func play(_ sender: UIBarButtonItem) {
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processFunction), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        
        timer.invalidate()
    }
    
    
    @IBAction func plusTen(_ sender: UIBarButtonItem) {
        
        count += 10
    }
    
    
    @IBAction func minusTen(_ sender: UIBarButtonItem) {
        
        if(count > 0 && count - 10 > 0){
            
            count -= 10
        }
    }
    
    
    @IBAction func resetTimer(_ sender: UIBarButtonItem) {
        
        timer.invalidate()
        count = 210
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

