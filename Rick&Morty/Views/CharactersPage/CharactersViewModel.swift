//
//  CharactersViewModel.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 07.07.2024.
//

import Foundation

final class CharactersViewModel: ObservableObject {
    
    @Published var characters: [Result] = []
    
    init() {
        getCharacters()
    }
    
    func getCharacters() {
        APIManager.shared.getDataCharacter { [weak self] results in
            DispatchQueue.main.async {
                self?.characters = results
            }
        }
    }
}
