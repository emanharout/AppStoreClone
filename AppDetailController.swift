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
  }
  
  // Return Header View
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
    return header
  }
  
  // Header Size
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 170)
  }
}

class AppDetailHeader: BaseCell {
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    return iv
  }()
  
  override func setupViews(){
    backgroundColor = .blue
    
    addSubview(imageView)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.backgroundColor = .yellow
    
    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
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
