//
//  ContentView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.albums) { album in
                    NavigationLink(value: album) {
                        Label("Row \(album.title)", systemImage: "\(album.id).circle")
                    }
                }
            }
            .navigationDestination(for: AlbumModel.self) { album in
                Text("Detail \(album.title)")
            }
            .navigationTitle("Navigation")
        }
        .onAppear {
            viewModel.getAlbums()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
