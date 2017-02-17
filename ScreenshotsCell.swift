//
//  ScreenshotsCell.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/16/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class ScreenshotsCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .clear
    return cv
  }()
  
  private let cellId = "cellId"
  
  override func setupViews() {
    super.setupViews()
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(collectionView)
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(ScreenshotImageCell.self, forCellWithReuseIdentifier: cellId)
    
    collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  // Number of Items
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  // Dequeue Cell
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
  }
  
  // Size Cell
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: frame.height - 28)
  }
  
  // Inset Cells
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
  }
}

class ScreenshotImageCell: BaseCell {
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .green
    iv.contentMode = .scaleAspectFill
    return iv
  }()
  
  override func setupViews() {
    super.setupViews()
    
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

  }
}
