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
  
  var tricks = TrickBank(trickDifficulty: 1)
  var score : Int {
    return tricks.list[trickNumber].successCount
  }
  var trickNumber : Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    trickNameLabel.text = tricks.list[trickNumber].name.uppercased()
    demoImage.image = UIImage(named: tricks.list[trickNumber].image)
    trickNumberLabel.text = "\(trickNumber + 1) / \(tricks.list.count)"
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }

  @IBAction func trickCompletedButtonPressed(_ sender: UIButton) {
    
    switch sender.tag {
    case 1:
      print("Good dog!")
      tricks.list[trickNumber].successCount += 1
      updateUI()
    case 2:
      print("Try again!")
    default:
      print("oops")
    }
    
    checkTrick()
    
  }
  
  func updateUI() {
    scoreLabel.text = "\(score)"
  }
  
  func nextTrick() {
    if trickNumber < tricks.count = 1 {
//      trickNameLabel.text = allQuestions.list[questionNumber].questionText
    }
    else {
      let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
      
      let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
        self.startOver()
      })
      
      alert.addAction(restartAction)
      
      present(alert, animated: true, completion: nil)
    }
  }
  
  func checkTrick() {
    if score > 5 {
      print("Your dog is doing well!")
      nextTrick()
    }
  }
  
  func startOver() {
    
  }
  
  
}

