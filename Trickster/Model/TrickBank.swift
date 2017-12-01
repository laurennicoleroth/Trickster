//
//  TrickBank.swift
//  Trickster
//
//  Created by Lauren Nicole Roth on 11/30/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import Foundation

class TrickBank {
  
  var list = [Trick]()
  var difficulty : Int
  
  init(trickDifficulty: Int) {
    self.difficulty = trickDifficulty
    switch difficulty {
    case 1:
      createLevelOne()
    case 2:
      print("Create intermediate level")
    default:
      print("Create a trickbank")
    }
    
    
  }
  
  func createLevelOne() {
    self.list.append(Trick(trickName: "Sit", demoImage: "sit.gif"))
  }
}
