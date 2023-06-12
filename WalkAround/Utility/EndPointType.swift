//
//  EndPointType.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 12/06/23.
//

import UIKit

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var methods: HTTPMethods { get }
}

enum EndPointItems {
    case product, carts, users
}

extension EndPointItems: EndPointType {
    var path: String {
        switch self {
        case .product:
            return Constants.APIParams.kProductPath
        case .carts:
            return Constants.APIParams.kCartPath
        case .users:
            return Constants.APIParams.kUsersPath
        }
    }

    var baseURL: String {
        return Constants.APIParams.kBaseURL
    }

    var url: URL? {
        switch self {
        case .product:
            return URL(string: "\(baseURL)\(path)")
        case .carts:
            return URL(string: "\(baseURL)\(path)")
        case .users:
            return URL(string: "\(baseURL)\(path)")
        }
    }

    var methods: HTTPMethods {
        switch self {
        case .product:
            return .get
        case .carts:
            return .get
        case .users:
            return .get
        }
    }
}
