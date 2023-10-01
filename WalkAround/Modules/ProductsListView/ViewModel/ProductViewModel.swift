//
//  ProductViewModel.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 02/06/23.
//

import Foundation

class ProductViewModel {

    var products: [ProductDetailsUIModel] = []
    var eventHandler: ((_ event: Event) -> Void)? // Data binding Closure

    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: [ProductDetailsUIModel].self,
                                  type: EndPointItems.product) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let product):
                self.products = product
                self.eventHandler?(.dataLoading)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ProductViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoading
        case error(Error?)
    }
}
