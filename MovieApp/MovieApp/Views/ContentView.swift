//
//  ContentView.swift
//  MovieApp
//
//  Created by Necati Bozkurt on 6.10.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
            
        TabView{
            MovieView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            SeriesView()
                .tabItem {
                    Label("Series", systemImage: "list.dash")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


