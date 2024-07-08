//
//  APIManager.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 07.07.2024.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    let urlStringToCharacter = "https://rickandmortyapi.com/api/character"
    let urlStringToEpisods = "https://rickandmortyapi.com/api/episode"
    let urlStringToLocation = "https://rickandmortyapi.com/api/location"
    
    func getDataCharacter(completion: @escaping ([Result]) -> Void) {
        let url = URL(string: urlStringToCharacter)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                return
            }
            if let ourData = try? JSONDecoder().decode(CharacterData.self, from: data) {
                completion(ourData.results)
            }
            else {
                print("Fail")
            }
           
        }
        task.resume()
    }
}
