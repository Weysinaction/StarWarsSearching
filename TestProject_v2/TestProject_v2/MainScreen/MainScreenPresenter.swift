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
        let mainModel = MainScreenModel()
        var protocolArray = [MainScreenModelProtocol]()
        
        let person = Person()
        let person2 = Person()
        let starship = Starship()
        let starship2 = Starship()
        
        let peopleDto = PeopleDto()
        peopleDto.name = "Luke SkyWalker"
        peopleDto.gender = "Male"
        
        let peopleDto2 = PeopleDto()
        peopleDto2.name = "Darth Vader"
        peopleDto2.gender = "Male"
        
        let starshipDto = StarshipDto()
        starshipDto.name = "Millennium Falcon"
        starshipDto.manufacturer = "Corellian Engineering Corporation"
        starshipDto.model = "YT-1300 light freighter"
        starshipDto.passengers = 6
        
        let starshipDto2 = StarshipDto()
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
        //let starshipProtocol: MainScreenModelProtocol = starship
        
        protocolArray.append(person)
        protocolArray.append(person2)
        protocolArray.append(person)
        protocolArray.append(starship)
        protocolArray.append(starship2)
        protocolArray.append(starship2)
        protocolArray.append(starship)
        protocolArray.append(starship2)
        
        mainModel.models = protocolArray
        model = mainModel
    }
}
