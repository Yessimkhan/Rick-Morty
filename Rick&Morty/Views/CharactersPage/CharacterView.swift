//
//  CharacterView.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 07.07.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterView: View {
    
    let characterName: String
    let characterStatus: Status
    let imageURL: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                
                WebImage(url: URL(string: imageURL)) { image in
                    image.resizable()
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                }
                
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                    
                VStack (alignment: .leading){
                    Text(characterName)
                        .bold()
                    Text("Status: \(characterStatus.rawValue)")
                        .foregroundStyle(.gray)
                }
                .foregroundStyle(.black)
                .padding(.leading, 6)
            }
        }
        .background(.white)
        .cornerRadius(6)
        .shadow(color: .gray, radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CharacterView(
        characterName: "Yesssimkhan Zhumash",
        characterStatus: Status.alive,
        imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
}
