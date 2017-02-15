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
  var apps: [App]?
  
  static func sampleAppCategories() -> [AppCategory] {
    
    let bestNewAppsCategory = AppCategory()
    bestNewAppsCategory.name = "Best New Apps"
    
    var apps = [App]()
    
    // logic
    let frozenApp = App()
    frozenApp.name = "Disney Build It: Frozen"
    frozenApp.imageName = "frozen"
    frozenApp.category = "Entertainment"
    frozenApp.price = NSNumber(floatLiteral: 3.99)
    
    apps.append(frozenApp)
    
    bestNewAppsCategory.apps = apps
    
    return [bestNewAppsCategory]
  }
  
}

class App: NSObject {
  
  var id: NSNumber?
  var name: String?
  var category: String?
  var imageName: String?
  var price: NSNumber?
  
}
