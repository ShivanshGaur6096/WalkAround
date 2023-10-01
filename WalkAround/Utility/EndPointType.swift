//
//  EndPointType.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 12/06/23.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var methods: HTTPMethods { get }

    var body: Encodable? { get }
    var headers: [String: String]? { get }
}

enum EndPointItems {
    case product, carts, users
    case addProduct(product: AddProduct)
}

extension EndPointItems: EndPointType {
    var path: String {
        switch self {
        case .product:
            return APIConstants.APIPath.kProductPath
        case .carts:
            return APIConstants.APIPath.kCartPath
        case .users:
            return APIConstants.APIPath.kUsersPath
        case .addProduct:
            return APIConstants.APIPath.kAddProductPath
        }
    }

    var baseURL: String {
        switch self {
        case .product:
            return APIConstants.APIParams.kBaseURL
        case .addProduct:
            return APIConstants.APIParams.kAddProductBaseURL

            // For Carts and User in future
        default:
            return APIConstants.APIParams.kBaseURL
        }
    }

    var url: URL? {
        switch self {
        case .product:
            return URL(string: "\(baseURL)\(path)")
        case .carts:
            return URL(string: "\(baseURL)\(path)")
        case .users:
            return URL(string: "\(baseURL)\(path)")
        case .addProduct:
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
        case .addProduct:
            return .post
        }
    }

    var body: Encodable? {
        switch self {
        case .product:
            return nil
        case .addProduct(let product):
            return product

            // For Carts and User in future
        default:
            return nil
        }
    }

    static var commonHeader: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }

    var headers: [String : String]? {
        return EndPointItems.commonHeader
    }
}
