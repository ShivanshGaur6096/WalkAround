//
//  ProductDetailView.swift
//  WalkAround
//
//  Created by Shivansh Gaur on 11/09/23.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var product: ProductDetailsUIModel

//    init(product: ProductDetailsUIModel) {
//        self.product = product
//    }

    var body: some View {
        Text("hello")
//        VStack {
//            List {
//                Text(product.title)
//                Text(product.description)
//                Text(String(product.price))
//                Text(String(product.rating.rate))
//            }.listRowSeparator(.hidden)
//
//            HStack(alignment: .center) {
//                // Button Add to Cart
//                Button {
//                    // Action
//                } label: {
//                    Text("Add to Cart")
//                }
//                Spacer()
//                // Button Buy Now
//                Button {
//                    // Action
//                } label: {
//                    Text("Buy Now")
//                }.background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.yellow)
//                )
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.orange, lineWidth: 2)
//                )
//            }.padding()
//        }
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView(navBarTitle: "Backpack, Fit 15 Laptops",
//                          productImage: "Backpack, Fit 15 Laptops",
//                          productName: "Backpack, Fit 15 Laptops",
//                          productDescription: "Your perfect back for everyday use and wals in the forest.",
//                          productPrice: 109.95,
//                          productRating: 3.9,
//                          productPurchaseCount: 120)
//    }
//}
