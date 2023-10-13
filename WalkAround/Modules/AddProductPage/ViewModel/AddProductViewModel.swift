//
//  AddProductViewModel.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 01/10/23.
//

import Foundation

class AddProductViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoading
        case error(Error?)
        case newProductAdded(product: ProductDetailsUIModel)
    }

    var eventHandler: ((_ event: Event) -> Void)?

    func addProducts(parameters: ProductDetailsUIModel) {
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: ProductDetailsUIModel.self,
                                  type: EndPointItems.addProduct(product: parameters)) { result in
            switch result {
            case .success(let product):
                self.eventHandler?(.newProductAdded(product: product))
            case .failure(let error):
                self.eventHandler?(.error(error))
            }

        }
    }
}
