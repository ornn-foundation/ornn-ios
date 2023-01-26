//
//  DeeplinkManager.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Foundation

public protocol DeeplinkManager {
    func manage(_ url: URL) -> ScreenTarget.Screen
}

public class DeeplinkManagerImpl: DeeplinkManager {
    public init() {}

    public func manage(_ url: URL) -> ScreenTarget.Screen {
        guard url.scheme == ScreenTarget.Scheme.ornn,
              url.host == ScreenTarget.Host.ornn
        else { return .today }
        return matches(path: url.path)
    }
}

extension DeeplinkManagerImpl {
    func matches(path: String) -> ScreenTarget.Screen {
        var screen: ScreenTarget.Screen
        switch path {
        case ScreenTarget.Path.flight:
            screen = .flight
        case ScreenTarget.Path.hotel:
            screen = .hotel
        case ScreenTarget.Path.plan:
            screen = .plan
        case ScreenTarget.Path.setting:
            screen = .setting
        default:
            screen = .today
        }
        return screen
    }
}
