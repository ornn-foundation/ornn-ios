//
//  CacheManager.swift
//  Ornn
//
//  Created by Naluebet Manpati on 26/1/2566 BE.
//

import Foundation

public struct CacheManager {
    public static let shared = CacheManager()
    private let cache = NSCache<NSString, AnyObject>()

    public func set(_ object: AnyObject, for key: KeyManager) {
        cache.setObject(object, forKey: key.id as NSString)
    }

    public func get(for key: KeyManager) -> AnyObject? {
        return cache.object(forKey: key.id as NSString)
    }

    public func remove(for key: KeyManager) {
        cache.removeObject(forKey: key.id as NSString)
    }

    public func clear() {
        cache.removeAllObjects()
    }
}
