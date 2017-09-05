//
//  ViewController.swift
//  Week One in Class
//
//  Created by Patrick on 8/29/17.
//  Copyright © 2017 Patrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// put outlets here 
var index = 0
    
    
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("*** viewDidLoad has exexuted", Date())
       
      
        
    }

 

    @IBAction func messageButtonPressed(_ sender: UIButton) {
     let messages = ["You are fantastic",
                     "You are great!" ,
                     "You are amazing",
                     "When the genius bar needs help, they call you!",
                     "You Brighten My Day!"]
      var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        } while index == newIndex
        
       index = newIndex
        
        messageLabel.text = messages[index]
        
   //     var randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
   //     messageLabel.text = messages[randomIndex]
  /*
        messageLabel.text = messages[index]
        index = index+1
        if index == messages.count - 1 {
            index = 0}
        else {index = index + 1
        }
 */
 
        
        
 /* let message1 = "You are the Bomb!"
 let message2 = "You are Great!"
 let message3 = "You are Amazing!"if messageLabel.text == message1 {
            messageLabel.text = message2
        } else if messageLabel.text == message2 {
        messageLabel.text = message3 }
        else { messageLabel.text = message1
    }
*/
}

}
