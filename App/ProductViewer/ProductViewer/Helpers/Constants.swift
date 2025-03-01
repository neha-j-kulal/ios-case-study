//
//  Constants.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation

struct Constants {
    struct API {
        static let baseURL = "https://api.target.com/mobile_case_study_deals/v1"
        static let deals = "/deals"
    }
    
    struct Message {
        static let failiedToLoadImage = "Failed to load image"
    }

    struct NavigationTitle {
        static let details = "Detail"
        static let list = "List"
    }
    
    struct Text {
        static let productDetails = "Product details"
    }
    
    struct ButtonText {
        static let addToCart = "Add to cart"
    }
}
