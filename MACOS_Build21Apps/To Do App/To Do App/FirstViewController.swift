//
//  FirstViewController.swift
//  To Do App
//
//  Created by sunny on 26/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var table: UITableView!
    
    var todoArrayObject = [String]()
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{

            return todoArrayObject.count

    
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let myCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myCell")
        
            
        myCell.textLabel?.text = todoArrayObject[indexPath.row]
        
        
        return myCell
        
    
    }
    
     internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            todoArrayObject.remove(at: indexPath.row)
            UserDefaults.standard.set(todoArrayObject, forKey: "todoArray")
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
            
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let tempItems = UserDefaults.standard.object(forKey: "todoArray") as? [String]{
            
            todoArrayObject = tempItems
        }
        
        table.reloadData()
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UserDefaults.standard.removeObject(forKey: "todoArray")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

