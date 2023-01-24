//
//  TodayView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var sheetViewModel: SheetViewModel
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    Button {
                        sheetViewModel.present = true
                    } label: {
                        Text("Modal")
                    }
                    ForEach(viewModel.albums) { album in
                        NavigationLink(value: album) {
                            Label("Row \(album.title)", systemImage: "\(album.id).circle")
                        }
                    }
                }
                .navigationDestination(for: AlbumModel.self) { album in
                    Text("Detail \(album.title)")
                }
            }
            .navigationTitle("Today")
            .onAppear {
                viewModel.getAlbums()
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
