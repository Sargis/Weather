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
    
    var weatherSummary: String? {
        willSet {
            self.weatherLabel.text = newValue
        }
    }
    
    private lazy var headerView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "aaa"))
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var weatherLabel: UILabel = {
        let label = UILabel.init()
        label.text = "Loading Data..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func setupConstraints() {
        addSubview(headerView)
        self.headerView.addSubview(self.weatherLabel)
        
        pageView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.weatherLabel.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor).isActive = true
        self.weatherLabel.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor).isActive = true
    }
}
