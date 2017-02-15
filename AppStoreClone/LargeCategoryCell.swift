//
//  LargeCategoryCell.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/15/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCell {
  
  fileprivate let largeAppCellId = "LargeAppCellId"
  
  override func setupViews() {
    super.setupViews()
    
    appsCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellId)
  }
  
  // Collection View Functions
  override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: frame.height - 32)
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.largeAppCellId, for: indexPath) as! AppCell
    cell.app = appCategory?.apps?[indexPath.item]
    return cell
  }
  
}

extension LargeCategoryCell {
  fileprivate class LargeAppCell: AppCell {
    fileprivate override func setupViews() {
      imageView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(imageView)
      
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
      imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
      
    }
  }
}
