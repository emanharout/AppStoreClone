//
//  ScreenshotsCell.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/16/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class ScreenshotsCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  var app: App? {
    didSet {
      collectionView.reloadData()
    }
  }
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .clear
    return cv
  }()
  
  private let cellId = "cellId"
  
  let dividerView: UIView = {
    let divider = UIView()
    divider.backgroundColor = UIColor.init(white: 0.4, alpha: 0.4)
    return divider
  }()
  
  override func setupViews() {
    super.setupViews()
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    dividerView.translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(collectionView)
    addSubview(dividerView)
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(ScreenshotImageCell.self, forCellWithReuseIdentifier: cellId)
    
    collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    dividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
    dividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    dividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
  }
  
  // Number of Items
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return app?.screenshots?.count ?? 0
  }
  
  // Dequeue Cell
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotImageCell
    
    if let imageName = app?.screenshots?[indexPath.item] {
      cell.imageView.image = UIImage(named: imageName)
    }
    return cell
  }
  
  // Size Cell
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 240, height: frame.height - 28)
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
    // Since scale aspect fit, image spills over, must mask to bounds
    imageView.layer.masksToBounds = true
    
    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

  }
}
