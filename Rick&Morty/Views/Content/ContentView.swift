//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Yessimkhan Zhumash on 07.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        if viewModel.needForceUpdate {
            Spacer()
            ZStack(alignment: .bottom) {
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "exclamationmark.triangle")
                        Text("Update now".uppercased())
                    }
                    .foregroundStyle(Color.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(12))
                    .padding(.horizontal)
                }

            }
        } else {
            TabView {
                NavigationStack {
                    CharactersPage(viewModel: CharactersViewModel())
                        .navigationTitle("Characters")
                }
                .tabItem {
                    Label("Сharacters", systemImage: "person")
                }
                
                NavigationStack {
                    
                }
                .tabItem {
                    Label("Lockations", systemImage: "globe")
                }
                
                NavigationStack {
                    
                }
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
                
                NavigationStack {
                    
                }
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
