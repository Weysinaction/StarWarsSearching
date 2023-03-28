//
//  DetailScreenViewViewController.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import UIKit

final class FavoritesScreenViewController: UIViewController {
    //MARK: - Public properties
    var presenter: FavoritesPresenter?
    var tableView: UITableView?
    
    //MARK: - Private properties
    private let entityCellId = "EntityCell"

    // MARK: - FavoriteScreenViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView?.reloadData()
    }
    
    //MARK: - Private methods
    
    private func setupViewController() {
        title = "Favorites"
        self.view.backgroundColor = .white
        
        setupTabBar()
        setupTableView()
    }
    
    private func setupTabBar() {
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EntityCell.self, forCellReuseIdentifier: entityCellId)
        self.tableView = tableView
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension FavoritesScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.model?.favoriteModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: entityCellId, for: indexPath) as? EntityCell,
              let entity = presenter?.model?.favoriteModels[indexPath.row] else { return UITableViewCell() }
        cell.delegate = self
        cell.updateCell(entity: entity)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let entity = presenter?.model?.favoriteModels[indexPath.row] else { return 0 }
        if entity.entityType == .person {
           return 120
        } else if entity.entityType == .starship  {
           return 150
        }
        return 0
    }
}

//MARK: - EntityCellDelegate
extension FavoritesScreenViewController: EntityCellDelegate {
    func deleteRow(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        tableView?.deleteRows(at: [indexPath], with: .left)
    }
}
