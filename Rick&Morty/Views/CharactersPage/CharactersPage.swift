//
//  CharactersPage.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 07.07.2024.
//

import SwiftUI

struct CharactersPage: View {
    @StateObject var viewModel: CharactersViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.characters, id: \.id) { character in
                        NavigationLink(value: character.id) {
                            CharacterView(characterName: character.name, characterStatus: character.status, imageURL: character.image)
                        }
                        
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self) { value in
                if let character = viewModel.characters.first(where: { $0.id == value }) {
                    CharacterDetailsPage(viewModel: CharacterDetailsViewModel(character: character))
                        .navigationTitle(character.name.uppercased())
                        .navigationBarTitleDisplayMode(.inline)
                } else {
                    Text("Character not found")
                }
            }
        }
    }
}

#Preview {
    CharactersPage(viewModel: CharactersViewModel())
}
