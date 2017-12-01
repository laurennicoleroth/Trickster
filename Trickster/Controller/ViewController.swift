//
//  ViewController.swift
//  Trickster
//
//  Created by Lauren Nicole Roth on 11/30/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var trickNameLabel: UILabel!
  @IBOutlet var demoImage: UIImageView!
  @IBOutlet var trickNumberLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var progressView: UIView!
  
  //Place your instance variables here
  
  let tricks = TrickBank(trickDifficulty: 1)
  var trickNumber : Int = 0
  var score : Int = 0
  
  
  // This gets called when the UIViewController is loaded into memory when the app starts
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
    
  }
  
  // Nothing to modify here. This gets called when the system is low on memory
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //This action gets called when either the true or false button is pressed.
  @IBAction func trickCompletedButtonPressed(_ sender: AnyObject) {
    
    if sender.tag == 1 {
//      pickedAnswer = true
    }
      
    else if sender.tag == 2 {
//      pickedAnswer = false
    }
    
    checkAnswer()
    
    trickNumber = trickNumber + 1
    
    updateUI()
    
  }
  
  // This method will update all the views on screen (progress bar, score label, etc)
  func updateUI() {
    
    progressView.frame.size.width = (view.frame.size.width / 13) * CGFloat(trickNumber)
    
    trickNumberLabel.text = String(trickNumber) + "/13"
    
    scoreLabel.text = "Score: " + String(score)
    
    nextQuestion()
  }
  
  //This method will update the question text and check if we reached the end.
  func nextQuestion() {
    
    if trickNumber <= tricks.list.count - 1 {
      trickNameLabel.text = tricks.list[trickNumber].name
      demoImage.image = UIImage(named: tricks.list[trickNumber].image )
    }
    else {
      let alert = UIAlertController(title: "Awesome", message: "You've finished all the tricks, do you want to start over?", preferredStyle: .alert)
      
      let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
        self.startOver()
      })
      
      alert.addAction(restartAction)
      
      present(alert, animated: true, completion: nil)
    }
    
  }
  
  //This method will check if the user has got the right answer.
  func checkAnswer() {
    
    let successCount = tricks.list[trickNumber].successCount
    
    if successCount > 0 {
      
      ProgressHUD.showSuccess("Good Dog!")
      
      score = score + 1
    }
    else {
      
      ProgressHUD.showError("Try again!")
    }
  }
  
  //This method will wipe the board clean, so that users can retake the quiz.
  func startOver() {
    
    trickNumber = 0
    score = 0
    
    updateUI()
    
  }
  
  
}

