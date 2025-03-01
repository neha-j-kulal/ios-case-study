//
//  DealsListViewModel.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation

class ProductsListViewModel {
    private let networkManager: NetworkManagerProtocol
    var products: [Product] = []
    var onProductsFetched: (() -> Void)?
    var onProductDetailFetched: ((Int) -> Void)?
    var onError: ((Error) -> Void)?
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchProductList() {
        let apiEndpoint = ProductAPIRequest.productList
        networkManager.fetchData(apiEndpoint: apiEndpoint) { [weak self] (result: Result<ProductList, Error>) in
            switch result {
            case .success(let productList):
                self?.products = productList.products
                self?.onProductsFetched?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
    
    func fetchProductDetail(at index: Int) {
        let apiEndpoint = ProductAPIRequest.productDetails(index: index)
        networkManager.fetchData(apiEndpoint: apiEndpoint) { [weak self] (result: Result<Product, Error>) in
            switch result {
            case .success(let product):
                self?.products[index] = product
                self?.onProductDetailFetched?(index)
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}
