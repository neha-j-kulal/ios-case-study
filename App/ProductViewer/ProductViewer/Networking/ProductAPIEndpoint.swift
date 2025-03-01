//
//  ProductAPIEndpoint.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation

enum ProductAPIRequest {
    case productList
    case productDetails(index: Int)
    
    var baseURL: String {
        return Constants.API.baseURL
    }
    
    var path: String {
        switch self {
        case .productList:
            return Constants.API.deals
        case .productDetails(let index):
            return Constants.API.deals + "/\(index)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var headers: [String: String]? {
        return nil
    }
}
