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
    let personCellIdentifier = "PersonCell"
    let starshipCellIdentifier = "StarshipCell"

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
        tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
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
        tableView.register(PersonCell.self, forCellReuseIdentifier: personCellIdentifier)
        tableView.register(StarshipCell.self, forCellReuseIdentifier: starshipCellIdentifier)
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
        let peoplesCount = presenter?.model?.peoples?.count ?? 0
        let starshipsCount = presenter?.model?.starships?.count ?? 0
        return peoplesCount + starshipsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row < presenter?.model?.peoples?.count ?? 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: starshipCellIdentifier, for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: personCellIdentifier, for: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let number = indexPath.row % 2
        switch number {
            case 0: return 150
            default: return 120
        }
    }
}

//MARK: -UISearchBarDelegate
extension MainScreenViewController: UISearchBarDelegate {
    
}
