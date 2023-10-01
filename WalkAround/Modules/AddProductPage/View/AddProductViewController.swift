//
//  AddProductViewController.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 01/10/23.
//

import UIKit

class AddProductViewController: UIViewController {
    private var viewModel = AddProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        observEvent()
    }

    @IBAction func addProductButton(_ sender: Any) {
        let product = AddProduct(title: "Shivansh")
        viewModel.addProducts(parameters: product)
    }
}

extension AddProductViewController {

    func observEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }

            switch event {
            case .loading:
                print("Product Loading.....")
            case .stopLoading:
                print("Stop Loading.....")
            case .dataLoading:
                print("Data Loaded.....")
//                DispatchQueue.main.async {
//                    self.productList.reloadData()
//                }
            case .error(let error):
                print(error)
            case .newProductAdded(product: let product):
                print(product)
            }
        }
    }
}
