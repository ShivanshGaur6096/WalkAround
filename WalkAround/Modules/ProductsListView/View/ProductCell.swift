//
//  ProductCell.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 04/06/23.
//

import UIKit



class ProductCell: UITableViewCell {

    private enum Constants {
        static let bgViewCornerRadius: CGFloat = 10
        static let imageViewCornerRadius: CGFloat = 5

        static let bgViewColor: UIColor = UIColor(hexString: "#e6eff5")
        static let productDescriptionColor: UIColor = UIColor(hexString: "#485557")
        static let productNameColor: UIColor = UIColor(hexString: "#1d1e1f")
        static let ratingLabelColour: UIColor = UIColor(hexString: "#ffd500")

        static let lineCount: Int = 3
        static let lineBreakMode: NSLineBreakMode = .byTruncatingTail
    }


    @IBOutlet weak var productCardBackground: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPurchaseCount: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var buyNowButton: UIButton!


// Property Observer - Whenever changes happen it will be called
//    var products: ProductsDetailModel? {
//        didSet {
//            productDetailsConfig()
//        }
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
//        applyAccessibility()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureUI() {
        /// View
        productImage.layer.cornerRadius = Constants.imageViewCornerRadius
        productCardBackground.layer.cornerRadius = Constants.bgViewCornerRadius
        productImage.contentMode = .scaleAspectFit
        productName.numberOfLines = Constants.lineCount
        productDescription.numberOfLines = Constants.lineCount
        productName.lineBreakMode = Constants.lineBreakMode
        productDescription.lineBreakMode = Constants.lineBreakMode

        /// Fonts
        productName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

        /// Colour
        productCardBackground.backgroundColor = Constants.bgViewColor
        productRating.textColor = Constants.ratingLabelColour
        productName.textColor = Constants.productNameColor
        productDescription.textColor = Constants.productDescriptionColor
    }

    func set(products: ProductDetailsUIModel) {
        productImage.setImage(with: products.image)
        productName.text = products.title
        productPurchaseCount.text = String(products.rating.count)
        productRating.text = "⭐️\(products.rating.rate)"
        productDescription.text = products.description
        productPrice.text = "$\(products.price)"
        buyNowButton.setTitle("Buy", for: .normal)
    }
}


// MARK: - Accessibility
extension ProductCell {
    func setupAccessibility() {
    }

    func assignAccessibilityIds() {
    }

    func updateAccessibilityLabels() {
    }
}
