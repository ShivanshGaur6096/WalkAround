//
//  Constants.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 02/06/23.
//

import UIKit

/// Contains all  query param, header , payload keys
public struct Constants {
    struct APIParams {
        public static let kBaseURL = "https://fakestoreapi.com/"
        public static let kProductPath = "products"
        public static let kCartPath = "carts"
        public static let kUsersPath = "users"
    }

    struct VCIdentifier {
        public static let kProductsCellId = "ProductCell"
    }
}
