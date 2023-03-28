//
//  NetworkManagerMock.swift
//  TestProject_v2Tests
//
//  Created by Dima Lazarev on 28.03.2023.
//

import Foundation
@testable import TestProject_v2

class NetworkManagerMock: NetworkManagerProtocol {
    func getPeoplesBySearch(searchString: String, completion: @escaping (([TestProject_v2.PeopleDto]?) -> Void)) {
        if searchString == "Lu" {
            var peopleDto = PeopleDto()
            peopleDto.name = "Luke Skywalker"
            peopleDto.gender = "Male"
            peopleDto.starships = ["x-wing", "y-wing"]
            var peoples: [PeopleDto] = []
            peoples.append(peopleDto)
            completion(peoples)
        } else {
            completion(nil)
        }
    }
    
    func getStarshipsBySearch(searchString: String, completion: @escaping (([TestProject_v2.StarshipDto]?) -> Void)) {
        if searchString == "X-W" {
            var starshipDto = StarshipDto()
            starshipDto.name = "X-Wing"
            starshipDto.model = "T65 X-wing"
            starshipDto.manufacturer = "Incom Corporation"
            starshipDto.passengers = "0"
            var starships: [StarshipDto] = []
            starships.append(starshipDto)
            completion(starships)
        } else {
            completion(nil)
        }
    }
}
