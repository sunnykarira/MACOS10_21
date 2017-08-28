//
//  ViewController.swift
//  tictactoe
//
//  Created by sunny on 28/08/17.
//  Copyright © 2017 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var crossOrZeroState = true
    
    let winningCombinations = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], [3,5,7], [1,4,7], [2,5,8], [3,6,9]]
    
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: UIButton) {
    
        
        resetValues()
        
    }
    private func checkWinner(_ crossOrZeroState: Bool) -> Bool{
        var count = 0
        
        let crossOrZero: String?
        
        if crossOrZeroState{
            crossOrZero = "X"
        }else{
            crossOrZero = "O"
        }
        
        //print(crossOrZero!)
        
        
        for combination in winningCombinations{
            count = 0
            for combinationValue in combination{
            
                 let button = self.view.viewWithTag(combinationValue) as? UIButton
                
                if button?.titleLabel?.text == crossOrZero{
                    count += 1
                }else{
                
                        break
                }
                
            }
            if count == 3{
                return true
            }
        }
        
        
        return false
    }
    
    private func allFilled() -> Bool{
        
        var count = 0
        
        for i in 1...9{
            
            let button = self.view.viewWithTag(i) as? UIButton
            
            
            if button?.titleLabel?.text == "X" || button?.titleLabel?.text == "O"{
                
                count += 1
            }else{
            
                return false
            }
            
        }
        
        if count == 9{
            return true
        }
        
        return false
        
    }
    
    private func resetValues(){
        
        crossOrZeroState = true
        label.text = ""
        playAgainButton.setTitle("", for: [])
        
        for i in 1...9{
            
            let button = self.view.viewWithTag(i) as? UIButton
            
            button?.isEnabled = true
            button?.alpha = 1
            button?.setTitle("", for:[])
            

            
        }
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let button = self.view.viewWithTag(sender.tag) as? UIButton
        
        if crossOrZeroState{
            
            button?.setTitle("X", for: [])
            
        }else{
        
            button?.setTitle("O", for: [])
        }
        
        button?.isEnabled = false
        button?.alpha = 0.5
        
        let wins = checkWinner(crossOrZeroState)
        
        if wins{
            
            label.text = crossOrZeroState ? "X Wins" : "O Wins"
            let playAgainButton = self.view.viewWithTag(10) as! UIButton
            
            playAgainButton.setTitle("Play Again", for: [])
        }
        
        if !wins && allFilled(){
            
            label.text = "Match Draw"
            let playAgainButton = self.view.viewWithTag(10) as! UIButton
            
            playAgainButton.setTitle("Play Again", for: [])
        }
        
        crossOrZeroState = !crossOrZeroState
        //print(crossOrZeroState)
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

