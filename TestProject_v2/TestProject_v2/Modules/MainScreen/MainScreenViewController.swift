//
//  ViewController.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

final class MainScreenViewController: UIViewController {
    //MARK: - Public properties
    var presenter: MainScreenPresenter?
    
    //MARK: - Private properties
    private var searchBar: UISearchBar?
    private let entityCellId = "EntityCell"
    private var tableView: UITableView?

    // MARK: MainScreenViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.refreshData()
    }
    
    //MARK: - Public methods
    func reloadTableViewData() {
        tableView?.reloadData()
    }
    
    //MARK: - Private methods
    private func setupViewController() {
        title = "MainScreen"
        self.view.backgroundColor = .white
    
        setupTabBar()
        setupSearchBar()
        setupTableView()
        setupGestureToDismissKeyboard()
    }
    
    private func setupGestureToDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    private func setupTabBar() {
        let tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        self.tabBarItem = tabBarItem
    }
    
    private func setupTableView() {
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
    
    private func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 75).isActive = true
        searchBar.placeholder = "Search"
        searchBar.keyboardType = .default
        self.searchBar = searchBar
    }
    
    //MARK: Selectors
    @objc func dismissKeyboard() {
        searchBar?.endEditing(true)
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.models.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: entityCellId, for: indexPath) as? EntityCell,
              let entity = presenter?.models[indexPath.row] else { return UITableViewCell() }
        cell.updateCell(entity: entity)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let entity = presenter?.models[indexPath.row] else { return 0 }
        if entity.entityType == .person {
           return 120
        } else if entity.entityType == .starship  {
           return 150
        }
        return 0
    }
}

//MARK: - UISearchBarDelegate
extension MainScreenViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchString = searchBar.text else { return }
        if searchString.count >= 2 {
            presenter?.getData(by: searchString)
            searchBar.resignFirstResponder()
        }
    }
}
