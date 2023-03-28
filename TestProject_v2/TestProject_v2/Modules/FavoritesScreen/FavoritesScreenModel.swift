//
//  DetailScreenModel.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation

final class FavoritesModel {
    //MARK: - Public properties
    static let shared = FavoritesModel()
    
    //MARK: - Private properties
    private var models = [Entity]()
    private var userDefaults = UserDefaults()
    var favoriteModels: [Entity] {
        set {
            models = newValue
            userDefaults.set(try? PropertyListEncoder().encode(models), forKey: "favoriteModels")
        }
        get {
            return models
        }
    }
    
    //MARK: - Initializers
    private init() {}
}
