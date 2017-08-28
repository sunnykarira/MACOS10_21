//
//  ViewController.swift
//  animationpart1
//
//  Created by sunny on 28/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var buttonText: UIButton!
    var count = 0
    var state = false
    var timer = Timer()
    
    // Animation Actions
    @IBAction func fadeInAction(_ sender: UIBarButtonItem) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideInAction(_ sender: UIBarButtonItem) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2, animations:{
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
    }
    
    
    @IBAction func growAction(_ sender: UIBarButtonItem) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1){
            self.image.frame = CGRect(x: 0, y:0, width: 200, height: 200)
        }
    }
    
    @IBAction func startStopButton(_ sender: UIButton) {
        
        if state == true{
            
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(processImage), userInfo: nil, repeats: true)
        state = false
        buttonText.setTitle("Stop Animation", for: [])
            
        
        }else{
            
            timer.invalidate()
            state = true
            buttonText.setTitle("Start Animation", for: [])
        
        }
        
        
    }
    
    func processImage(){
        
        count += 1
        if(count > 2){
            count = 0
        }
        
        let string = "giphy-\(count).jpg"
        image.image = UIImage(named: string)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        state = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

