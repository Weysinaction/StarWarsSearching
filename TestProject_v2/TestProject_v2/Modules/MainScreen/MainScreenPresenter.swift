//
//  MainScreenPresenter.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation
import UIKit

final class MainScreenPresenter {
    //MARK: - Public properties
    var models = [Entity]()
    weak var viewController: MainScreenViewController?
    
    //MARK: - Private properties
    private let networkManager: NetworkManagerProtocol!
    
    //MARK: - Initializers
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    //MARK: - Public methods
    func refreshData() {
        setFavorites()
        viewController?.reloadTableViewData()
    }
    
    func getData(by: String = "") {
        clearModels()
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        getPeoples(by: by) {
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        getStarships(by: by) {
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.refreshData()
        }
    }
    
    //MARK: - Private methods
    private func getPeoples(by: String, completion: @escaping () -> Void) {
        networkManager.getPeoplesBySearch(searchString: by) { [weak self] peoples in
            guard let peoples = peoples else { return }
            for people in peoples {
                var entity = Entity()
                entity.entityType = .person
                entity.firstLine = people.name
                entity.secondLine = people.gender
                entity.thirdLine = String(people.starships?.count ?? 0)
                self?.models.append(entity)
            }
            completion()
        }
    }
    
    private func getStarships(by: String, completion: @escaping () -> Void) {
        networkManager.getStarshipsBySearch(searchString: by) { [weak self] starships in
            guard let starships = starships else { return }
            for starship in starships {
                var entity = Entity()
                entity.entityType = .starship
                entity.firstLine = starship.name
                entity.secondLine = starship.model
                entity.thirdLine = starship.manufacturer
                entity.fourthLine = starship.passengers
                self?.models.append(entity)
            }
            completion()
        }
    }
    
    private func setFavorites() {
        models = models.map { entity in
            if isFavorite(entity: entity) {
                var newEntity = entity
                newEntity.isFavorite = true
                return newEntity
            } else {
                var newEntity = entity
                newEntity.isFavorite = false
                return newEntity
            }
        }
    }
    
    private func isFavorite(entity: Entity) -> Bool {
        var isFavorite = false
        let model = FavoritesModel.shared
        model.favoriteModels.forEach { currentEntity in
            if currentEntity.firstLine == entity.firstLine {
                isFavorite = true
            }
        }
        return isFavorite
    }
    
    private func clearModels() {
        models = []
        refreshData()
    }
}
