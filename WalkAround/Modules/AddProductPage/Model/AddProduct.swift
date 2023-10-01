//
//  AddProduct.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 01/10/23.
//

import Foundation

/// This model is for both Encodable, Decodable for POST API Method so we can write Codable {it is typealias of both}
/// Make `id` mutabele i.e `var` as its nil value so that value can be provided

struct AddProduct: Codable {
    var id: Int? = nil
    let title: String
}
