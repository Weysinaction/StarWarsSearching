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
        
        let person = Entity()
        let starship = Entity()
        
        let peopleDto = PeopleDto()
        peopleDto.name = "Luke SkyWalker"
        peopleDto.gender = "Male"
        
        let starshipDto = StarshipDto()
        starshipDto.name = "Millennium Falcon"
        starshipDto.manufacturer = "Corellian Engineering Corporation"
        starshipDto.model = "YT-1300 light freighter"
        starshipDto.passengers = 6
        
        person.firstLine = peopleDto.name
        person.secondLine = peopleDto.gender
        person.thirdLine = "10"
        person.entityType = .person
        
        starship.firstLine = starshipDto.name
        starship.secondLine = starshipDto.model
        starship.thirdLine = starshipDto.manufacturer
        starship.fourthLine = "\(String(describing: starshipDto.passengers))"
        starship.entityType = .starship
        
        protocolArray.append(starship)
        protocolArray.append(person)
        protocolArray.append(person)
        protocolArray.append(starship)
        protocolArray.append(starship)
        protocolArray.append(starship)
        protocolArray.append(person)
        protocolArray.append(person)
        protocolArray.append(starship)
        protocolArray.append(starship)
        protocolArray.append(starship)
        protocolArray.append(person)
        protocolArray.append(person)
        
        mainModel.models = protocolArray
        model = mainModel
    }
}
