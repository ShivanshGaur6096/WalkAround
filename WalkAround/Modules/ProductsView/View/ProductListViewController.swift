//
//  ProductListViewController.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 02/06/23.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productList: UITableView!
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

extension ProductListViewController {

    func configuration() {
        productList.register(UINib(nibName: "ProductCell", bundle: nil),
                             forCellReuseIdentifier: AppConstants.VCIdentifier.kProductsCellId)
        initViewModel()
        observEvent()
    }

    func initViewModel() {
        viewModel.fetchProducts()
    }

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
                DispatchQueue.main.async {
                    self.productList.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}


extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.VCIdentifier.kProductsCellId) as? ProductCell else { return UITableViewCell() }
        let products = viewModel.products[indexPath.row]
        cell.set(products: products)
        cell.selectionStyle = .none
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {

}
