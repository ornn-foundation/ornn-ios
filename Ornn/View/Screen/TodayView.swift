//
//  TodayView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var sheetViewModel: SheetViewModel
    @EnvironmentObject var tabBarViewModel: TabBarViewModel
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
                        .hideTabBar(isTabBar: $tabBarViewModel.isTabBar)
                }
            }
            .floatingButton(icon: "plus") {}
            .navigationTitle("Today")
            .showTabBar(isTabBar: $tabBarViewModel.isTabBar, animation: true)
            .onAppear {
                viewModel.getAlbums()
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .environmentObject(SheetViewModel())
            .environmentObject(TabBarViewModel())
    }
}
