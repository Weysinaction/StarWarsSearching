//
//  ViewController.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    var presenter: MainScreenPresenter?
    var searchBar: UISearchBar?
    var tableView: UITableView?
    let entityCellId = "EntityCell"

    // MARK: MainScreenViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    func setupViewController() {
        title = "MainScreen"
        self.view.backgroundColor = .white
        
        presenter?.getPeoples()
        setupTabBar()
        setupSearchBar()
        setupTableView()
    }
    
    func setupTabBar() {
        //let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        let tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        self.tabBarItem = tabBarItem
    }
    
    func setupTableView() {
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.searchBar?.bottomAnchor ?? self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EntityCell.self, forCellReuseIdentifier: entityCellId)
        self.tableView = tableView
    }
    
    func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 75).isActive = true
        searchBar.placeholder = "Search"

        self.searchBar = searchBar
    }
}

//MARK: -UITableViewDataSource, UITableViewDelegate
extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: entityCellId, for: indexPath) as? EntityCell,
              let entity = presenter?.model?.models?[indexPath.row] else { return UITableViewCell() }
        cell.updateCell(entity: entity)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let entity = presenter?.model?.models?[indexPath.row] else { return 0 }
        if entity.entityType == .person {
           return 120
        } else if entity.entityType == .starship  {
           return 150
        }
        return 0
    }
}

//MARK: -UISearchBarDelegate
extension MainScreenViewController: UISearchBarDelegate {
    
}
