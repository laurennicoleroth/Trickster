//
//  ViewController.swift
//  Trickster
//
//  Created by Lauren Nicole Roth on 11/30/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var demoImage: UIImageView!
  @IBOutlet var trickNumberLabel: UILabel!
  
  var tricks = TrickBank(trickDifficulty: 1)

  override func viewDidLoad() {
    super.viewDidLoad()
    
    demoImage.image = UIImage(named: tricks.list[0].image)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

  }

  @IBAction func trickCompletedButtonPressed(_ sender: UIButton) {
    
    switch sender.tag {
    case 1:
      print("Good dog!")
    case 2:
      print("Try again!")
    default:
      print("oops")
    }
    
  }
  

}

