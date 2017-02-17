//
//  Models.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/14/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class FeaturedApps: NSObject {
  
  var bannerCategory: AppCategory?
  var appCategories: [AppCategory]?

  override func setValue(_ value: Any?, forKey key: String) {
    if key == "categories" {
      appCategories = [AppCategory]()
      
      for dict in value as! [[String: Any]] {
        let appCategory = AppCategory()
        appCategory.setValuesForKeys(dict)
        appCategories?.append(appCategory)
      }
    } else if key == "bannerCategory" {
      bannerCategory = AppCategory()
      bannerCategory?.setValuesForKeys(value as! [String: Any])
    } else {
      super.setValue(value, forKey: key)
    }
  }
}

class AppCategory: NSObject {
  
  var name: String?
  var apps: [App]?
  var type: String?
  
  override func setValue(_ value: Any?, forKey key: String) {
    if key == "apps" {
      apps = [App]()
      for dict in value as! [[String: AnyObject]] {
        let app = App()
        app.setValuesForKeys(dict)
        apps?.append(app)
      }
    } else {
      super.setValue(value, forKey: key)
    }
  }
  
  static func fetchFeaturedApps(completionHandler: @escaping (FeaturedApps)->()) {
    let urlString = "http://www.statsallday.com/appstore/featured"
    
    URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
      
      guard error == nil else {
        print(error!)
        return
      }
      
      do {
        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary<String, Any>
        
        let featuredApps = FeaturedApps()
        featuredApps.setValuesForKeys(json)
        
        DispatchQueue.main.async {
          completionHandler(featuredApps)
        }
          
      } catch let error {
        print(error)
      }
      
    }.resume()
  }
  
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
    
    let bestNewGamesCategory = AppCategory()
    bestNewGamesCategory.name = "Best New Games"
    
    var bestNewGamesApps = [App]()
    
    let telepaintApp = App()
    telepaintApp.name = "Telepaint"
    telepaintApp.imageName = "telepaint"
    telepaintApp.category = "Games"
    telepaintApp.price = NSNumber(floatLiteral: 2.99)
    
    bestNewGamesApps.append(telepaintApp)
    
    bestNewGamesCategory.apps = bestNewGamesApps
    
    return [bestNewAppsCategory, bestNewGamesCategory ]
  }
  
}

class App: NSObject {
  
  var id: NSNumber?
  var name: String?
  var category: String?
  var imageName: String?
  var price: NSNumber?
  var screenshots: [String]?
  var desc: String?
  var appInformation: Any?
  
  // Description is already a property inherited from NSObject so we have to set values from keys mapped from JSON to desc instead
  override func setValue(_ value: Any?, forKey key: String) {
    if key == "description" {
      desc = value as? String
    } else {
      super.setValue(value, forKey: key)
    }
  }
  
}
