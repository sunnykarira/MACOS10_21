//
//  ViewController.swift
//  timesTableApp
//
//  Created by sunny on 26/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sliderData: Int = 1

    @IBOutlet var table: UITableView!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 50
    
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let myCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myCell")
        
        
        myCell.textLabel?.text = String((indexPath.row + 1) * sliderData)
        
        
        return myCell
    
    }
    

    @IBOutlet var slider: UISlider!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        sliderData = Int(slider.value)
        print(sliderData)
        table.reloadData()
    
        
        
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

