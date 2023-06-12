//
//  ProductsDetailModel.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 02/06/23.
//

import Foundation

struct ProductDetailsUIModel: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: RatingModel
}

struct RatingModel: Decodable {
    let rate: Double
    let count: Int
}
