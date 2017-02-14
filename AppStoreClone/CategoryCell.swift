//
//  CategoryCell.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/14/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

// Custom Cell Class
class CategoryCell: UICollectionViewCell {
  
  let appCellId = "AppCellId"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    backgroundColor = .black
    
    addSubview(appsCollectionView)
    appsCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    appsCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8.0).isActive = true
    appsCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8.0).isActive = true
    appsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  // Create collectionView within cell
  lazy var appsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let appsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    appsCollectionView.delegate = self
    appsCollectionView.dataSource = self
    appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: self.appCellId)
    
    appsCollectionView.backgroundColor = .blue
    appsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    return appsCollectionView
  }()
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  // Number of Cells
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  // Create App Cells
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.appCellId, for: indexPath) as! AppCell
    return cell
  }
  
  // Size Cells
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 150, height: frame.height)
  }
  
}

class AppCell: UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    backgroundColor = .red
  }
}
