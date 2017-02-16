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
  
  var featuredAppsController: FeaturedAppsController?
  
  var appCategory: AppCategory? {
    didSet {
      
      if let name = appCategory?.name {
        nameLabel.text = name
      }
      
      // Despite CollectionHeader being a subclass of CategoryCell,
      // it won't display appCategory data unless reload upon assignment
      appsCollectionView.reloadData()
    }
  }
  let appCellId = "AppCellId"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Best New Apps"
    label.font = UIFont.systemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dividerLineView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  func setupViews() {
    backgroundColor = .clear
    
    addSubview(appsCollectionView)
    addSubview(dividerLineView)
    addSubview(nameLabel)

    appsCollectionView.delegate = self
    appsCollectionView.dataSource = self
    appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: self.appCellId)
    
//    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
//    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerLineView]))
//    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
//    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appsCollectionView, "v1": dividerLineView, "nameLabel": nameLabel]))
    appsCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    appsCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    appsCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    appsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    dividerLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    dividerLineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
    dividerLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
    dividerLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    
    nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
  }
  
  // Create collectionView within cell
  lazy var appsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let appsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    appsCollectionView.backgroundColor = .clear
    appsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    return appsCollectionView
  }()
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  // Number of Cells
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return appCategory?.apps?.count ?? 0
  }
  
  // Create App Cells
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.appCellId, for: indexPath) as! AppCell
    cell.app = appCategory?.apps?[indexPath.item]
    return cell
  }
  
  // Size Cells
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: frame.height - 30)
  }
  
  // Margin Insets
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 14, 0, 14)
  }
  
  // Cell Selection
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let app = appCategory?.apps?[indexPath.item] {
      featuredAppsController?.showAppDetail(for: app)
    }
  }
  
}
