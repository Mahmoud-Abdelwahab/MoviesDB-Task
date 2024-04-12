//
//  MovieList.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 11/04/2024.
//

import SwiftUI
struct MovieList: View {
    
    var body: some View {
        NavigationView {
            List(0..<10) { item in
                Text("movie \(item)")
            }
            .navigationBarTitle("Trending Movies")
        }

    }
}

#Preview {
    MovieList()
}
