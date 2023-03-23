//
//  MainScreenPresenter.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation
import UIKit

class MainScreenPresenter {
    var model: MainScreenModel?
    weak var viewController: MainScreenViewController?
    
    func getPeoples() {
        var mainModel = MainScreenModel()
        
        var peopleArray = [Person]()
        var starshipArray = [Starship]()
        
        var person = Person()
        var person2 = Person()
        var starship = Starship()
        var starship2 = Starship()
        
        var peopleDto = PeopleDto()
        peopleDto.name = "Luke SkyWalker"
        peopleDto.gender = "Male"
        
        var peopleDto2 = PeopleDto()
        peopleDto2.name = "Darth Vader"
        peopleDto2.gender = "Male"
        
        var starshipDto = StarshipDto()
        starshipDto.name = "Millennium Falcon"
        starshipDto.manufacturer = "Corellian Engineering Corporation"
        starshipDto.model = "YT-1300 light freighter"
        starshipDto.passengers = 6
        
        var starshipDto2 = StarshipDto()
        starshipDto.name = "Millennium"
        starshipDto.manufacturer = "Corellian Corporation"
        starshipDto.model = "YT-1300"
        starshipDto.passengers = 25
        
        person.people = peopleDto
        person.isFavorite = false
        person2.people = peopleDto2
        person2.isFavorite = true

        starship.starship = starshipDto
        starship.isFavorite = true
        starship2.starship = starshipDto2
        starship2.isFavorite = false
        
        peopleArray.append(person)
        peopleArray.append(person2)
        peopleArray.append(person)
        starshipArray.append(starship)
        starshipArray.append(starship2)
        starshipArray.append(starship2)
        starshipArray.append(starship)
        starshipArray.append(starship2)
        
        mainModel.peoples = peopleArray
        mainModel.starships = starshipArray
        
        model = mainModel
    }
}
