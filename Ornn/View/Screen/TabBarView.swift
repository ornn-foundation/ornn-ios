//
//  TabBarView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var sheetViewModel = SheetViewModel()
    @StateObject private var tabBarViewModel = TabBarViewModel()
    @StateObject private var screenViewModel = ScreenViewModel()

    var body: some View {
        TabView(selection: $screenViewModel.screen) {
            TodayView()
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("Today")
                }
                .tag(ScreenTarget.Screen.today)
            HotelView()
                .tabItem {
                    Image(systemName: "bed.double")
                    Text("Hotel")
                }
                .tag(ScreenTarget.Screen.hotel)
            Text("Flight")
                .tabItem {
                    Image(systemName: "airplane.departure")
                    Text("Flight")
                }
                .tag(ScreenTarget.Screen.flight)
            Text("Plan")
                .tabItem {
                    Image(systemName: "globe.asia.australia")
                    Text("Plan")
                }
                .tag(ScreenTarget.Screen.plan)
            Text("Setting")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Setting")
                }
                .tag(ScreenTarget.Screen.setting)
        }
        .environmentObject(sheetViewModel)
        .environmentObject(tabBarViewModel)
        .environmentObject(screenViewModel)
        .onOpenURL(perform: screenViewModel.onOpenURL)
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
