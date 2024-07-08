//
//  CharacterDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 08.07.2024.
//

import Foundation

final class CharacterDetailsViewModel: ObservableObject {
    
    let character: Result
    @Published var characters: [Result] = []
    
    init(character: Result) {
        self.character = character
        
    }
}


