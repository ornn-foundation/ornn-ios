//
//  TabBarView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var sheetViewModel = SheetViewModel()

    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("Today")
                }
            HotelView()
                .tabItem {
                    Image(systemName: "bed.double.fill")
                    Text("Hotel")
                }
            Text("Flight")
                .tabItem {
                    Image(systemName: "airplane.departure")
                    Text("Flight")
                }
            Text("Plan")
                .tabItem {
                    Image(systemName: "globe.asia.australia.fill")
                    Text("Plan")
                }
            Text("Setting")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Setting")
                }
        }
        .environmentObject(sheetViewModel)
        .sheet(isPresented: $sheetViewModel.present) {
            Text("Detail")
                .presentationDetents([.medium, .large])
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
