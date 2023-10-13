//
//  ProductListViewController.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 02/06/23.
//

import UIKit
import StoreKit

/// Keep adding sections to the view controller as new idea come up 😉
enum Section {
    case buyPrimeMembershipSection, productListing
}

class ProductListViewController: UIViewController {
    var viewModel = ProductViewModel()
    private var inAppPurchaseModel = [SKProduct]()
    let sectionArray: [Section] = [.buyPrimeMembershipSection, .productListing]

    @IBOutlet weak var productList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupInAppPurchaseCell()
        fetchInAppPurchasProducts()
    }

    func setupInAppPurchaseCell() {
        self.productList.register(UINib(nibName: "InAppPurchaseCell", bundle: nil), forCellReuseIdentifier: "InAppPurchaseCell")
        SKPaymentQueue.default().add(self)
    }

    @IBAction func addProductButtonTapped(_ sender: UIBarButtonItem) {
        // Analytic Implementation
    }
}

extension ProductListViewController {

    func configuration() {
        productList.delegate = self
        productList.dataSource = self
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

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        sectionArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return inAppPurchaseModel.count
        case 1:
            return viewModel.products.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let product = inAppPurchaseModel[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.VCIdentifier.kInAppPurchaseCellId) as? InAppPurchaseCell
            else {
                return UITableViewCell()
            }
            cell.updateData(data: product)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.VCIdentifier.kProductsCellId,
                                                           for: indexPath) as? ProductCell
            else {
                return UITableViewCell()
            }
            let products = viewModel.products[indexPath.row]
            cell.set(products: products)
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            tableView.deselectRow(at: indexPath, animated: true)
            // Show purchase
            let payment = SKPayment(product: inAppPurchaseModel[indexPath.row])
            SKPaymentQueue.default().add(payment)
        default:
            break
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? AddProductViewController {
            createVC.productListVC = self
        }
    }
}

// MARK: - Setting-up StoreKit for In-App Purchases

extension ProductListViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    enum Product: String, CaseIterable {
        case becomePrimeMember = "com.myapp.primeMembership"
        case buyEarlyAccessPass = "com.myapp.earlyAccessPass"
    }

    // Map all above product to SKProduct Array i.e. inAppPurchaseModel
    private func fetchInAppPurchasProducts() {
        let request = SKProductsRequest(productIdentifiers: Set(Product.allCases.compactMap({ $0.rawValue })))
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.inAppPurchaseModel = response.products
            self.productList.reloadData()
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        transactions.forEach {
            switch $0.transactionState {
            case .purchasing:
                print("Purchasing")
            case .purchased:
                print("Purchased")
                SKPaymentQueue.default().finishTransaction($0)
            case .failed:
                print("Failed to purchase")
            case .restored:
                print("Restored")
                break
            case .deferred:
                print("Deferred")
                break
            @unknown default:
                print("Other Issue")
                break
            }
        }
    }
}
