//
//  ScreenTarget.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Foundation

public enum ScreenTarget {
    public enum Screen {
        case today
        case hotel
        case flight
        case plan
        case setting
    }

    enum Path {
        static let today = "/today"
        static let hotel = "/hotel"
        static let flight = "/flight"
        static let plan = "/plan"
        static let setting = "/setting"
    }

    enum Host {
        static let ornn = "ornn.com"
    }

    enum Scheme {
        static let ornn = "ornn"
    }

    enum Query {
        static let id = "id"
    }
}
