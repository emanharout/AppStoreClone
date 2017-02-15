//
//  Models.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/14/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
  
  var name: String?
  var app: [App]?
  
}

class App: NSObject {
  
  var id: NSNumber?
  var name: String?
  var category: String?
  var imageName: String?
  var price: NSNumber?
  
}
