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
  var score : Int = 0
  var trickNumber : Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    trickNumberLabel.text = "\(trickNumber + 1) / \(tricks.list.count)"
    trickNameLabel.text = tricks.list[trickNumber].name.uppercased()
    demoImage.image = UIImage(named: tricks.list[trickNumber].image)
     progressView.frame.size.width = (view.frame.size.width / CGFloat(tricks.list.count)) * CGFloat(trickNumber)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }

  @IBAction func trickCompletedButtonPressed(_ sender: UIButton) {
    
    switch sender.tag {
    case 1:
      print("Good dog!")
      tricks.list[trickNumber].successCount += 1
      score += 1
      ProgressHUD.showSuccess("Good dog!!")
    case 2:
      print("Try again!")
      tricks.list[trickNumber].successCount -= 1
    default:
      print("oops")
    }
    
    checkTrickScore()
    
    updateUI()
    
  }
  
  func checkTrickScore() {
    print("Success on this trick: ", tricks.list[trickNumber].successCount)
    
    if trickNumber < tricks.list.count - 1 {
      trickNumber += 1
    } else {
      print("Ask user if they want to try another trick")
    }
  }
  
  func updateUI() {
    
    trickNameLabel.text = tricks.list[trickNumber].name.uppercased()
    demoImage.image = UIImage(named: tricks.list[trickNumber].image)
    trickNumberLabel.text = "\(trickNumber + 1) / \(tricks.list.count)"
    scoreLabel.text = "\(score)"
    progressView.frame.size.width = (view.frame.size.width / CGFloat(tricks.list.count)) * CGFloat(trickNumber)
    
//    progressLabel.text = String(trickNumber) + "\(tricks.list.count)"
    
    nextTrick()
  }
  
  func nextTrick() {
    if trickNumber < tricks.list.count {
      trickNameLabel.text = tricks.list[trickNumber].name
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
  
  
  func startOver() {
    
  }
  
  
}

