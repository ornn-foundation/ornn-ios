//
//  Bundle.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Foundation

public class BundleResource {
    public init() {}

    public func forResource(file: String, ofType: String = "json") -> Data {
        if let path = Bundle.main.path(forResource: file, ofType: ofType) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                return Data()
            }
        }
        return Data()
    }
}
