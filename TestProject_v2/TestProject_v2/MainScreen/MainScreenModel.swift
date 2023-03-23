//
//  MainScreenModel.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation

protocol MainScreenModelProtocol {
    var isFavorite: Bool? { get set }
}

class MainScreenModel {
    var models: [MainScreenModelProtocol]?
    
}

class Person: MainScreenModelProtocol {
    var people: PeopleDto?
    var isFavorite: Bool? = false
}

class Starship: MainScreenModelProtocol {
    var starship: StarshipDto?
    var isFavorite: Bool? = false
}

//MARK: Dto
class PeoplesDto {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PeopleDto]?
}

class PeopleDto {
    var name: String?
    var gender: String?
    var films: [String]?
    var starships: [String]?
}

class StarshipsDto {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [StarshipDto]?
}

class StarshipDto {
    var name: String?
    var model: String?
    var manufacturer: String?
    var passengers: Int?
}
