//
//  ViewController.swift
//  XOHW
//
//  Created by Haya Saleemah on 9/29/20.
//  Copyright © 2020 fms. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let generator = UINotificationFeedbackGenerator()
  var audioPlayre = AVAudioPlayer()
    
    @IBAction func playSound(_ sender: AnyObject) {
         sound (name: "sound1")
    }
    
    var activePlayer = 1
          
          var gameState = [0,0,0,0,0,0,0,0,0]
          
          let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
          var gameIsActive = true
          var finish = true
    var p1 = 0
    var p2 = 0
    
    @IBOutlet weak var TurnLabel: UILabel!
    @IBOutlet weak var nump1: UILabel!
    @IBOutlet weak var nump2: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
    
    
    generator.notificationOccurred(.success)
       if (gameState[sender.tag-1] == 0 && gameIsActive == true){
           
           gameState[sender.tag-1] = activePlayer
           
           if (activePlayer == 1)
           {
               sender.setBackgroundImage(UIImage(named: "tweety"), for: UIControl.State())
            sound (name: "bird")
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
               activePlayer = 2
           }
           else
           {
               sender.setBackgroundImage(UIImage(named: "sylvester"), for: UIControl.State())
            sound (name: "meow")
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
               activePlayer = 1
           }
           
       }
       
       for combination in winningCombinations
       {
           if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
           {
               gameIsActive = false
               
               if gameState[combination[0]] == 1
               {
                p1 += 1
                nump1.text = String(p1)
                if(p1 == 3){
                             sound (name: "sy")
                                  
                              }
                   let alertController = UIAlertController(title: " tweety win", message:  "قم بالضغط على زر اعاده اللعب ", preferredStyle: .alert)
                   
                   let restartAction = UIAlertAction(title: "اعاده اللعب", style: .cancel ,   handler:{action in self.restartGame() })
                                    alertController.addAction(restartAction)
                                    present(alertController, animated: true, completion: nil)
               }
                   
               else
               {
                p2 += 1
                               nump2.text = String(p2)
                if(p2 == 3){
                sound (name: "saveme")
                    
                }
                   let alertController = UIAlertController(title: " sylvester win", message: "قم بالضغط على زر اعاده اللعب ", preferredStyle: .alert)
                  let restartAction = UIAlertAction(title: "اعاده اللعب", style: .cancel ,   handler:{action in self.restartGame() })
                  alertController.addAction(restartAction)
                  present(alertController, animated: true, completion: nil)
                
               }
           }
       }
        
       gameIsActive = false
       
       for i in gameState
       {
           if i == 0{
               gameIsActive = true
            
               break
           }
       }
    if gameIsActive == false
      {
          let alertController = UIAlertController(title: "تعادل بين tweety & sylvester  ", message: "قم بالضغط على زر اعاده اللعب ", preferredStyle: .alert)

          let restartAction = UIAlertAction(title: "اعاده اللعب", style: .cancel ,   handler:{action in
            self.restartGame()
           })
          alertController.addAction(restartAction)
          present(alertController, animated: true, completion: nil)
      }
    
    }
   
    func restartGame()
{
    gameState = [0,0,0,0,0,0,0,0,0]
              gameIsActive = true
              activePlayer = 1
              
              for i in 1...9
              {
                  let button = view.viewWithTag(i) as! UIButton
                  button.setBackgroundImage(nil, for: UIControl.State())
                  
              }
    }
    
    func sound (name: String)
{
    let pathToSound2 = Bundle.main.path(forResource: name, ofType: "m4a")!
     let url = URL(fileURLWithPath: pathToSound2)
     do{
          audioPlayre = try AVAudioPlayer(contentsOf: url)
          audioPlayre.play()
            }
     catch {       }
}
}
