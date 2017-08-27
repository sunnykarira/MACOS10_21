//
//  SecondViewController.swift
//  To Do App
//
//  Created by sunny on 26/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet var textField: UITextField!

    @IBAction func todoItem(_ sender: UIButton) {
        
        let todoArrayObject = UserDefaults.standard.object(forKey: "todoArray")
        
        if todoArrayObject == nil{
            
            var todoArray = [String]()
            if let textFieldText = textField.text{
            
            todoArray.append(textFieldText)
            print("Item \(textFieldText) Added")
                
                UserDefaults.standard.set(todoArray, forKey: "todoArray")
                        
            }
            
        }else{
            
            if let textFieldText = textField.text{
                
                var todoArray = todoArrayObject as? Array<String>
                todoArray!.append(textFieldText)
                UserDefaults.standard.set(todoArray, forKey: "todoArray")
                
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }


}

