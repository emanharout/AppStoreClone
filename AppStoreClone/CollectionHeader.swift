//
//  CollectionHeader.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/15/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class CollectionHeader: CategoryCell {
  
  let cellId = "bannerCellId"
  
  override func setupViews() {
    
    appsCollectionView.delegate = self
    appsCollectionView.dataSource = self
    
    appsCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: cellId)
    
    addSubview(appsCollectionView)
    
    appsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    appsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    appsCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    appsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
  }
  
  // Collection View Functions
  override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width / 2 + 50, height: frame.height)
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BannerCell
    cell.app = appCategory?.apps?[indexPath.item]
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  fileprivate class BannerCell: AppCell {
    
    fileprivate override func setupViews() {
      imageView.layer.borderColor = UIColor.init(white: 0.5, alpha: 0.5).cgColor
      imageView.layer.borderWidth = 0.5
      imageView.layer.cornerRadius = 0
      
      imageView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(imageView)
      
      imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
      imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
      imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
      imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
      
    }
  }
}
