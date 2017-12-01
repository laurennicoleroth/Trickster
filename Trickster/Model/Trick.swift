//
//  Trick.swift
//  Trickster
//
//  Created by Lauren Nicole Roth on 11/30/17.
//  Copyright © 2017 Lauren Nicole Roth. All rights reserved.
//

import Foundation

class Trick {
  let name : String
  let image : String
  let level : Int = 0
  var successCount : Int = 0
  
  init(trickName: String, demoImage: String) {
    self.name = trickName
    self.image = demoImage
  }
}
