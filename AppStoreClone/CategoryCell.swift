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
    
    appsCollectionView.delegate = self
    appsCollectionView.dataSource = self
    appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: self.appCellId)
    
    appsCollectionView.backgroundColor = .clear
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
    return CGSize(width: 100, height: frame.height - 30)
  }
  
  // Margin Insets
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 14, 0, 14)
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
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "frozen")
    iv.contentMode = .scaleAspectFill
    iv.layer.cornerRadius = 16
    iv.layer.masksToBounds = true
    return iv
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Disney Built It: Frozen"
    label.font = UIFont.systemFont(ofSize: 14)
    label.numberOfLines = 2
    return label
  }()
  
  let categoryLabel: UILabel = {
    let label = UILabel()
    label.text = "Entertainment"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = UIColor.darkGray
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "$3.99"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = UIColor.darkGray
    return label
  }()
  
  func setupViews() {
    addSubview(imageView)
    addSubview(nameLabel)
    addSubview(categoryLabel)
    addSubview(priceLabel)
    
    imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
    nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
    categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
  }
}
