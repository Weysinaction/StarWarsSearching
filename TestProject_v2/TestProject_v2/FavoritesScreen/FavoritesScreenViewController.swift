//
//  DetailScreenViewViewController.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

class FavoritesScreenViewController: UIViewController {
    var presenter: FavoritesPresenter?
    var tableView: UITableView?
    let entityCellId = "EntityCell"

    // MARK: FavoriteScreenViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    func setupViewController() {
        title = "Favorites"
        self.view.backgroundColor = .white
        
        setupTabBar()
        setupTableView()
    }
    
    func setupTabBar() {
        //let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    }
    
    func setupTableView() {
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        //tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EntityCell.self, forCellReuseIdentifier: entityCellId)
        self.tableView = tableView
    }
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension FavoritesScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
