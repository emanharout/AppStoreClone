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
  let appsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .blue
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
}
