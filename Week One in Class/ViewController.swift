//
//  ViewController.swift
//  Week One in Class
//
//  Created by Patrick on 8/29/17.
//  Copyright © 2017 Patrick. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
// put outlets here 

    
    
    @IBOutlet weak var awesomeImage: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    // MARK: - Properties
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        print("*** viewDidLoad has exexuted", Date())
       
  
        
    }
    // MARK: - My Own Functions
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {        // can we load the file soundName?
        if let sound = NSDataAsset(name: soundName){
            // check if sound.data is a sound file
            do {
                try audioPlayer = AVAudioPlayer(data:sound.data)
                audioPlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else{
            //if reading in the NSDataAsset didnt load, tell the user/ report error
            print("ERROR: file \(soundName) didn't load")
        }
        
    }
 
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int)-> Int {
        
        var newIndex = -1
            repeat {
                newIndex = Int(arc4random_uniform(UInt32(maxValue)))
            } while lastNumber == newIndex
  return newIndex
            
        }
        
    //MARK: - Actions
    //show message
    @IBAction func soundSwitchedPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {

            //stop playing
                awesomePlayer.stop()
        }
    }
    
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
     let messages = ["You are fantastic",
                     "You are great!" ,
                     "You are amazing",
                     "When the genius bar needs help, they call you!",
                     "You Brighten My Day!"]
        
       index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //show image
        awesomeImage.isHidden = false
        
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image" + String(imageNumber))
        
        if soundSwitch.isOn {
            //get random number to use in soundName file
            
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            
            //play sound
            let    soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
   
        
        
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
