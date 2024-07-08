//
//  CharacterDetailsPage.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 08.07.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetailsPage: View {
    
    @StateObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                WebImage(url: URL(string: viewModel.character.image)) { image in
                    image.resizable()
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                }
                .frame(height: 350)
                .frame(maxWidth: .infinity)
                HStack {
                    CharacterStatus(color: .blue, status: viewModel.character.status.rawValue, statusName: "status")
                    CharacterStatus(color: .red, status: viewModel.character.gender.rawValue, statusName: "gender")
                }
                
                HStack {
                    CharacterStatus(color: .purple, status: viewModel.character.type, statusName: "type")
                    CharacterStatus(color: .green, status: viewModel.character.species.rawValue, statusName: "species")
                }
            }
        }
    }
}

struct CharacterStatus: View {
    
    let color: Color
    let status: String
    let statusName: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 30){
            HStack(spacing: 20) {
                Image(systemName: "bell")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .foregroundStyle(color)
                
                Text(status != "" ? status : "None")
                    .font(.title)
            }
            
            Text(statusName.uppercased())
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(color)
                .frame(width: 200, height: 50)
                .background(.gray.opacity(0.2))
                .cornerRadius(3.0)
        }
    }
}

#Preview {
    CharacterDetailsPage(viewModel: CharacterDetailsViewModel(
        character: Result(
            id: 1,
            name: "Rick Sanchez",
            status: Status.alive,
            species: Species.human,
            type: "",
            gender: Gender.male,
            origin: Location(
                name: "Earth (C-137)",
                url: "https://rickandmortyapi.com/api/location/1"),
            location: Location(
                name: "Citadel of Ricks",
                url: "https://rickandmortyapi.com/api/location/3"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode:
                ["https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
                "https://rickandmortyapi.com/api/episode/3"],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z")))
}
