 //
//  ContentView.swift
//  MusicPlayer
//
//  Created by Zachary Rich on 4/30/20.
//  Copyright © 2020 Zachary Rich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            homePage()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("home")
                        Text("Home")
                    }
                }
                .tag(0)
            searchPage()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("search")
                        Text("Search")
                    }
                }
                .tag(1)
            
            libraryPage()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("library")
                        Text("Library")
                }
            }
        .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
