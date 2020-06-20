//
//  TabViewController.swift.swift
//  Weather
//
//  Created by Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import UIKit
import Parchment


class HeaderPagingViewController: PagingViewController {
  override func loadView() {
    view = HeaderPagingView(
      options: options,
      collectionView: collectionView,
      pageView: pageViewController.view
    )
  }
}


class TabViewController: UIViewController {

    private let viewControllers = [
        CityRouter.createModule(.peterburg),
        CityRouter.createModule(.moscow)
    ]
    
    private let pagingViewController = HeaderPagingViewController()
    
    private var headerConstraint: NSLayoutConstraint {
      let pagingView = pagingViewController.view as! HeaderPagingView
      return pagingView.headerHeightConstraint!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    fileprivate func setupUI() {
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        
        // Customize the menu styling.
        pagingViewController.selectedTextColor = .black
        pagingViewController.indicatorColor = .black
        pagingViewController.indicatorOptions = .visible(
          height: 1,
          zIndex: Int.max,
          spacing: .zero,
          insets: .zero
        )
        
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
          pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        pagingViewController.dataSource = self
        
        pagingViewController.delegate = self
        
        viewControllers.first?.tableView.delegate = self
    }


}


extension TabViewController: PagingViewControllerDataSource {
  
  func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
    let viewController = viewControllers[index]
    viewController.title = viewControllers[index].presenter?.city.description
    
    // Inset the table view with the height of the menu height.
    let height = pagingViewController.options.menuHeight + HeaderPagingView.HeaderHeight
    let insets = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
    viewController.tableView.contentInset = insets
    viewController.tableView.scrollIndicatorInsets = insets
    
    return viewController
  }
  
  func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
    return PagingIndexItem(index: index, title: viewControllers[index].presenter?.city.description ?? "")
  }
  
  func numberOfViewControllers(in: PagingViewController) -> Int{
    return viewControllers.count
  }
  
}

extension TabViewController: PagingViewControllerDelegate {
  
  func pagingViewController(_ pagingViewController: PagingViewController, didScrollToItem pagingItem: PagingItem, startingViewController: UIViewController?, destinationViewController: UIViewController, transitionSuccessful: Bool) {
    guard let startingViewController = startingViewController as? CityViewController else { return }
    guard let destinationViewController = destinationViewController as? CityViewController else { return }
    
    if transitionSuccessful {
      startingViewController.tableView.delegate = nil
      destinationViewController.tableView.delegate = self
    }
  }
  
  func pagingViewController(_: PagingViewController, willScrollToItem pagingItem: PagingItem, startingViewController: UIViewController, destinationViewController: UIViewController) {
    guard let destinationViewController = destinationViewController as? CityViewController else { return }
    
    if let scrollView = destinationViewController.tableView {
      let offset = headerConstraint.constant + pagingViewController.options.menuHeight
      scrollView.contentOffset = CGPoint(x: 0, y: -offset)
      updateScrollIndicatorInsets(in: scrollView)
    }
  }
}

extension TabViewController: UITableViewDelegate {
  
  func updateScrollIndicatorInsets(in scrollView: UIScrollView) {
    let offset = min(0, scrollView.contentOffset.y) * -1
    let insetTop = max(pagingViewController.options.menuHeight, offset)
    let insets = UIEdgeInsets(top: insetTop, left: 0, bottom: 0, right: 0)
    scrollView.scrollIndicatorInsets = insets
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard scrollView.contentOffset.y < 0 else {

        if headerConstraint.constant > 0 {
        headerConstraint.constant = 0
      }
      return
    }
    
    updateScrollIndicatorInsets(in: scrollView)
    
    let height = max(0, abs(scrollView.contentOffset.y) - pagingViewController.options.menuHeight)
    headerConstraint.constant = height
  }
  
}
