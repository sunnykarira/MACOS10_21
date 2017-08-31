//
//  PlacesTableViewController.swift
//  Places to visit (Memorable Places)
//
//  Created by sunny on 31/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    var placesToVisit = [String]()
    var latitudeArray = [String]()
    var longitudeArray = [String]()

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        table.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        placesToVisit = defaults.object(forKey: "placesToVisit") as? [String] ?? [String]()
        latitudeArray = defaults.object(forKey: "latitudeArray") as? [String] ?? [String]()
        longitudeArray = defaults.object(forKey: "longitudeArray") as? [String] ?? [String]()
        print(placesToVisit)
        
        table.reloadData();
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return placesToVisit.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let myCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myCell")
        
        myCell.textLabel?.text = placesToVisit[indexPath.row]

        return myCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            placesToVisit.remove(at: indexPath.row)
            latitudeArray.remove(at: indexPath.row)
            longitudeArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            defaults.set(placesToVisit, forKey: "placesToVisit")
            defaults.set(latitudeArray, forKey: "latitudeArray")
            defaults.set(longitudeArray, forKey: "longitudeArray")
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
