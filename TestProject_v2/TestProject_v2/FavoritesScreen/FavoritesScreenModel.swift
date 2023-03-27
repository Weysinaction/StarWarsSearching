//
//  DetailScreenModel.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation

class FavoritesModel {
    static let shared = FavoritesModel()
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
    
    private init() {}
}
