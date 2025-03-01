//
//  NetworkManagerProtocol.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(apiEndpoint: ProductAPIRequest, completion: @escaping (Result<T, Error>) -> Void)
}
