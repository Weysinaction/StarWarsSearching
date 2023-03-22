//
//  DetailScreenViewViewController.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

class FavoritesScreenViewController: UIViewController {
    var presenter: FavoritesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTabBar()
    }
    
    func setupViewController() {
        title = "FavoritesVC"
        self.view.backgroundColor = .gray
    }
    
    func setupTabBar() {
        let tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self.tabBarItem = tabBarItem
    }
}
