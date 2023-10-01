//
//  APIConstants.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 02/06/23.
//

/// Contains all  query param, header , payload keys
public struct APIConstants {
    struct APIParams {
        public static let kBaseURL = "https://fakestoreapi.com/"
        public static let kAddProductBaseURL = "https://dummyjson.com/"
    }

    struct APIPath {
        public static let kProductPath = "products"
        public static let kAddProductPath = "products/add"
        public static let kCartPath = "carts"
        public static let kUsersPath = "users"
    }
}
