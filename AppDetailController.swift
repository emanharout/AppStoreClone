//
//  AppDetailController.swift
//  AppStoreClone
//
//  Created by Emmanuoel Haroutunian on 2/16/17.
//  Copyright © 2017 Emmanuoel Haroutunian. All rights reserved.
//

import UIKit

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var app: App? {
    didSet {
      navigationItem.title = app?.name
    }
  }
  
  private let headerId = "headerId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    collectionView?.backgroundColor = .white
    collectionView?.alwaysBounceVertical = true
  }
  
  // Return Header View
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
    header.app = app
    
    return header
  }
  
  // Header Size
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 170)
  }
}

class AppDetailHeader: BaseCell {
  
  var app: App? {
    didSet {
      if let imageName = app?.imageName {
        imageView.image = UIImage(named: imageName)
      }
    }
  }
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.layer.cornerRadius = 16
    iv.layer.masksToBounds = true
    return iv
  }()
  
  override func setupViews(){
    addSubview(imageView)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.backgroundColor = .yellow
    
    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
    imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
    
    imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
    // Visual Format
//    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0(100)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
  }
  
}

class BaseCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    
  }
  
  
}
