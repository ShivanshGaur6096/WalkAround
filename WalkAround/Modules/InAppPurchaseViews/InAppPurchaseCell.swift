//
//  InAppPurchaseCellTableViewCell.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 13/10/23.
//

import UIKit
import StoreKit

class InAppPurchaseCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var inAppPurchaseTitle: UILabel!
    @IBOutlet weak var pricingLabel: UILabel!
    @IBOutlet weak var offerDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        offerDescription.numberOfLines = 0
        bgView.layer.cornerRadius = 10
    }

    func updateData(data: SKProduct) {
        self.selectionStyle = .none
        self.inAppPurchaseTitle.text = "\(data.localizedTitle) "
        self.pricingLabel.text = "at \(data.priceLocale.currencySymbol ?? "₹") \(data.price)"
        self.offerDescription.text = "\(data.localizedDescription)"
    }
}
