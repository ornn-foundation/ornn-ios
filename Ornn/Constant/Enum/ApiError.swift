//
//  ApiError.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Foundation
import Moya

public enum ApiError: Error, Equatable {
    case unauthorized
    case notFound
    case unknown
    case map(_ response: Response)
}

extension ApiError {
    var status: ApiError {
        switch self {
        case let .map(response):
            return mapError(response)
        default:
            return self
        }
    }

    private func mapError(_ response: Response) -> ApiError {
        switch response.statusCode {
        case 401:
            return .unauthorized
        case 404:
            return .notFound
        default:
            return .notFound
        }
    }
}
