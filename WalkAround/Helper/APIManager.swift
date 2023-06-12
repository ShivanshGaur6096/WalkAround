//
//  APIManager.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 02/06/23.
//

// TODO: Learn things
/// `final, lazy, singleton class(explained), generics, static`
/// `final` keyword is to restrict class not to be `inherited` by other class

// MARK: Singleton vs singleton
/// Singleton: - You cannot create Singleton class object outside of class `i.e. private init() {}`
/// `APIManager.shared.functionName()` - Way to access properties of class
/// singleton: - You can create object of class outside of class
/// `let manager = APIManager(); manager.functionName()`


import UIKit

enum DataError: Error {
    case invalideURL
    case invalidResopnse
    case network(Error?)
}

typealias Handler<T> = (Result<T, DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init() {}

    func request<T: Decodable>(modelType: T.Type,
                               type: EndPointType,
                               completion: @escaping Handler<T>) {
        /// Check URL
        guard let url = type.url else {
            completion(.failure(.invalideURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.network(error)))
                return
            }

            /// Check Response
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                
                completion(.failure(.invalidResopnse))
                return
            }

            do{
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }

        }.resume()
    }
}
