//
//  TestProject_v2Tests.swift
//  TestProject_v2Tests
//
//  Created by Dima Lazarev on 22.03.2023.
//

import XCTest
@testable import TestProject_v2

final class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManagerProtocol!
    var peoples: [PeopleDto]?
    var starships: [StarshipDto]?

    override func setUpWithError() throws {
        networkManager = NetworkManagerMock()
    }

    override func tearDownWithError() throws {
        networkManager = nil
        peoples = nil
        peoples = nil
    }

    func testShouldGetPeoplesBySearch() throws {
        networkManager.getPeoplesBySearch(searchString: "Lu") { peoples in
            self.peoples = peoples
        }
        let personName = peoples?.first?.name
        
        XCTAssertNotNil(peoples)
        XCTAssertEqual(personName, "Luke Skywalker")
    }
    
    func testShouldGetStarshipsBySearch() throws {
        networkManager.getStarshipsBySearch(searchString: "X-W") { starships in
            self.starships = starships
        }
        let firstStarshipName = starships?.first?.name
        
        XCTAssertNotNil(starships)
        XCTAssertEqual(firstStarshipName, "X-Wing")
    }
    
    func testShouldNotGetPeoplesBySearch() throws {
        networkManager.getPeoplesBySearch(searchString: "") { peoples in
            self.peoples = peoples
        }
        
        XCTAssertNil(peoples)
    }
    
    func testShouldNotGetStarshipsBySearch() throws {
        networkManager.getStarshipsBySearch(searchString: "") { starships in
            self.starships = starships
        }
        
        XCTAssertNil(starships)
    }
}
