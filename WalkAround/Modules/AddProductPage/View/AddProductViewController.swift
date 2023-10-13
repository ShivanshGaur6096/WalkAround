//
//  AddProductViewController.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 01/10/23.
//

import UIKit

// Call a delegate vs Notifications to relode data in previousVC

class AddProductViewController: UIViewController {
    private var viewModel = AddProductViewModel()
    var productListVC: ProductListViewController?

    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDescription: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productCategory: UITextField!

    let productCategoryPickerView = UIPickerView()
    let pickerViewToolBar = UIToolbar()
    let productCategoryList = ["men's clothing", "women's clothing", "jewelery", "electronics"]

    override func viewDidLoad() {
        super.viewDidLoad()
        observEvent()
        setupProductCategoryPickerView()
    }

    @IBAction func addProductButton(_ sender: Any) {
        guard let productName = productName.text,
              let productDescription = productDescription.text,
              let productPrice = Double(productPrice.text ?? "0.00"),
              let productCategory = productCategory.text  else { return }
        let product = ProductDetailsUIModel(title: productName,
                                            price: productPrice,
                                            description: productDescription,
                                            category: productCategory,
                                            image: "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
                                            rating: RatingModel(rate: 0.0, count: 00))
        viewModel.addProducts(parameters: product)
        productListVC?.viewModel.products.append(product)
        productListVC?.productList.reloadData()
        navigationController?.popViewController(animated: true)
    }
}

extension AddProductViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func setupProductCategoryPickerView() {
        productCategoryPickerView.delegate = self
        productCategoryPickerView.dataSource = self

        productCategory.inputView = productCategoryPickerView
        pickerViewToolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerDoneButton))
        pickerViewToolBar.items = [doneButton]
        productCategory.inputAccessoryView = pickerViewToolBar
    }

    @objc func pickerDoneButton() {
        let selectedCategory = productCategoryList[productCategoryPickerView.selectedRow(inComponent: 0)]
        productCategory.text = selectedCategory
        self.view.endEditing(true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        productCategoryList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return productCategoryList[row]
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
