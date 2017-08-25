//
//  ViewController.swift
//  Table Views
//
//  Created by sunny on 25/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var cellContents = ["John", "Bob", "Michael", "Christ"]

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return cellContents.count
    }
    


    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContents[indexPath.row]
        
        return cell
    
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

