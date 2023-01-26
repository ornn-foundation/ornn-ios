//
//  ScreenViewModel.swift
//  Ornn
//
//  Created by Naluebet Manpati on 25/1/2566 BE.
//

import Foundation

public class ScreenViewModel: ObservableObject {
    @Published var screen: ScreenTarget.Screen = .today

    private let deeplinkManager: DeeplinkManager

    public init(deeplinkManager: DeeplinkManager = DeeplinkManagerImpl()) {
        self.deeplinkManager = deeplinkManager
    }

    public func onOpenURL(_ url: URL) {
        let deeplink = deeplinkManager.manage(url)
        screen = deeplink
    }
}
