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
        return presenter?.model?.models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let person = presenter?.model?.models?[indexPath.row] as? Person,
           let cell = tableView.dequeueReusableCell(withIdentifier: personCellIdentifier, for: indexPath) as? PersonCell {
            cell.updateCell(person: person)
            return cell
        } else if let starship = presenter?.model?.models?[indexPath.row] as? Starship,
           let cell = tableView.dequeueReusableCell(withIdentifier: starshipCellIdentifier, for: indexPath) as? StarshipCell {
            cell.updateCell(starship: starship)
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let person = presenter?.model?.models?[indexPath.row] as? Person {
           return 120
        } else if let starship = presenter?.model?.models?[indexPath.row] as? Starship {
           return 150
        }
        return 0
    }
}

//MARK: -UISearchBarDelegate
extension MainScreenViewController: UISearchBarDelegate {
    
}
