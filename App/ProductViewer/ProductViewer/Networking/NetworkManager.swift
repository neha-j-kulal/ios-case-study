//
//  NetworkManager.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    func fetchData<T: Decodable>(apiEndpoint: ProductAPIRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: apiEndpoint.baseURL + apiEndpoint.path) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiEndpoint.method.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
