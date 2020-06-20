//
//  HeaderPagingView.swift
//  Weather
//
//  Created by Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import UIKit
import Parchment


class HeaderPagingView: PagingView {
  
  static let HeaderHeight: CGFloat = 200
  
  var headerHeightConstraint: NSLayoutConstraint?
  
  private lazy var headerView: UIImageView = {
    let view = UIImageView(image: UIImage(named: "Header"))
    view.contentMode = .scaleAspectFill
    view.clipsToBounds = true
    return view
  }()
  
  override func setupConstraints() {
    addSubview(headerView)
    
    pageView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    headerView.translatesAutoresizingMaskIntoConstraints = false
    
    headerHeightConstraint = headerView.heightAnchor.constraint(
      equalToConstant: HeaderPagingView.HeaderHeight
    )
    headerHeightConstraint?.isActive = true
    
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: options.menuHeight),
      collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      
      headerView.topAnchor.constraint(equalTo: topAnchor),
      headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      pageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      pageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      pageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      pageView.topAnchor.constraint(equalTo: topAnchor)
    ])
  }
}
