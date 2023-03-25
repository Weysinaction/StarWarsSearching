//
//  NetworkManager.swift
//  TestProject_v2
//
//  Created by Dima Lazarev on 22.03.2023.
//

import Foundation
import UIKit

class NetworkManager {
    func getPeoplesBySearch(searchString: String = "", completion: @escaping (([PeopleDto]?) -> Void)) {
        guard let url = URL(string: "https://swapi.dev/api/people/?search=\(searchString)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let results: PeoplesDto = try! JSONDecoder().decode(PeoplesDto.self, from: data)
            completion(results.results)
        }
        task.resume()
    }
    
    func getStarshipsBySearch(searchString: String = "", completion: @escaping (([StarshipDto]?) -> Void)) {
        guard let url = URL(string: "https://swapi.dev/api/starships/?search=\(searchString)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let results: StarshipsDto = try! JSONDecoder().decode(StarshipsDto.self, from: data)
            completion(results.results)
        }
        task.resume()
    }
}
