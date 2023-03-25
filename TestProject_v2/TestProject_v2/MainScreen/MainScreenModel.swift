//
//  MainScreenModel.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation

enum EntityType {
    case person
    case starship
}

protocol MainScreenModelProtocol {
    var firstLine: String? { get set }
    var secondLine: String? { get set }
    var thirdLine: String? { get set }
    var fourthLine: String? { get set }
    var entityType: EntityType? { get set }
    var isFavorite: Bool? { get set }
}

struct MainScreenModel {
    var models: [MainScreenModelProtocol]?
    
}

struct Entity: MainScreenModelProtocol {
    var firstLine: String?
    var secondLine: String?
    var thirdLine: String?
    var fourthLine: String?
    var isFavorite: Bool? = false
    var entityType: EntityType?
}

//MARK: Dto
struct PeoplesDto: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PeopleDto]?
}

struct PeopleDto: Codable {
    var name: String?
    var gender: String?
    var films: [String]?
    var starships: [String]?
}

struct StarshipsDto: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [StarshipDto]?
}

struct StarshipDto: Codable {
    var name: String?
    var model: String?
    var manufacturer: String?
    var passengers: String?
}
