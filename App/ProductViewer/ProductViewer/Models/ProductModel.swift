//
//  ProductModel.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
}

struct Product: Codable {
    let id: Int
    let title: String
    let aisle: String
    let description: String
    let imageUrl: String
    let regularPrice: Price
    let salePrice: Price?
    let fulfillment: String
    let availability: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case aisle
        case description
        case imageUrl = "image_url"
        case regularPrice = "regular_price"
        case salePrice = "sale_price"
        case fulfillment
        case availability
    }
    
    var saleCost: String {
        if let salePrice {
            return salePrice.currencySymbol + String(format: "%.2f", Double(salePrice.amountInCents) / 100)
        } else {
            return regularPrice.currencySymbol + String(format: "%.2f", Double(regularPrice.amountInCents) / 100)
        }
    }
    
    var regularCost: String {
        return "reg. " + regularPrice.currencySymbol + String(format: "%.2f", Double(regularPrice.amountInCents) / 100)
    }
}

struct Price: Codable {
    let amountInCents: Int
    let currencySymbol: String
    let displayString: String

    enum CodingKeys: String, CodingKey {
        case amountInCents = "amount_in_cents"
        case currencySymbol = "currency_symbol"
        case displayString = "display_string"
    }
    
}
