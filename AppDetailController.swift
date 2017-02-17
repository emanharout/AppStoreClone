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
  
  let segmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["Details","Reviews","Related"])
    sc.tintColor = .darkGray
    sc.selectedSegmentIndex = 0
    return sc
  }()
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.layer.cornerRadius = 16
    iv.layer.masksToBounds = true
    return iv
  }()
  
  override func setupViews(){
    addSubview(imageView)
    addSubview(segmentedControl)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
    imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    
    segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
    segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
    segmentedControl.heightAnchor.constraint(equalToConstant: 34).isActive = true
    segmentedControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    
    // Visual Format Helper Func
//    addConstraints(with: "H:|-14-[v0(100)]", views: imageView)
  }
  
}

extension UIView {
  func addConstraints(with format: String, views: UIView...) {
    var viewsDict = [String: Any]()
    
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      viewsDict[key] = view
      view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
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
