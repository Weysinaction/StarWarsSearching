//
//  MainScreenPresenter.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation
import UIKit

class MainScreenPresenter {
    var models = [MainScreenModelProtocol]()
    weak var viewController: MainScreenViewController?
    let networkManager = NetworkManager()
    
    func getPeoples(by: String, completion: @escaping () -> Void) {
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
    
    func getStarships(by: String, completion: @escaping () -> Void) {
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
            self?.reloadTableView()
        }
    }
    
    func clearModels() {
        models = []
        reloadTableView()
    }
    
    func reloadTableView() {
        viewController?.reloadTableView()
    }
}
