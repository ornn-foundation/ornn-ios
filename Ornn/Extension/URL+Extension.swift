//
//  URL+Extension.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import Foundation

extension URL {
    static func from(string: String) -> URL {
        guard let url = URL(string: string) else {
            fatalError("Invalid URL")
        }
        return url
    }
}
