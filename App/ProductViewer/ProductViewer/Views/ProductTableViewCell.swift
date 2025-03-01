//
//  ProductTableViewCell.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var regPriceLabel: UILabel!
    @IBOutlet weak var fulfillmentLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        salePriceLabel.text = nil
        regPriceLabel.text = nil
        fulfillmentLabel.text = nil
        productNameLabel.text = nil
        availabilityLabel.text = nil
        productImage.image = nil
    }
    
    func configure(with product: Product) {
        productNameLabel.text = product.title
        productNameLabel.font = .medium
        productNameLabel.textColor = .grayDarkest
        
        salePriceLabel.text = product.saleCost
        salePriceLabel.font = .largeBold
        salePriceLabel.textColor = .targetRed
        
        regPriceLabel.text = product.regularCost
        regPriceLabel.font = .small
        regPriceLabel.textColor = .grayMedium
        
        fulfillmentLabel.text = product.fulfillment
        fulfillmentLabel.font = .small
        fulfillmentLabel.textColor = .textLightGray
        
        availabilityLabel.font = .small
                
        let attributedString = NSMutableAttributedString(string: product.availability, attributes: [
            .foregroundColor: UIColor.targetTextGreen
        ])
        let greyAttributedString = NSAttributedString(string: " in aisle \(product.aisle)", attributes: [
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(greyAttributedString)
                
        availabilityLabel.attributedText = attributedString
    
        productImage.setImage(from: product.imageUrl)
        productImage.layer.cornerRadius = 10
    }
}

