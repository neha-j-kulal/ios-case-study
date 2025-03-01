//
//  ProductsListViewController.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation
import SwiftUI

///Product List Screen
class ProductsListViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchProductList()
    }
    
    private func setupUI() {
        title = Constants.NavigationTitle.list
        view.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: ProductTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ProductTableViewCell.identifier)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel.onProductsFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.onProductDetailFetched = { [weak self] index in
            DispatchQueue.main.async {
                if let product = self?.viewModel.products[index] {
                    let detailView = ProductDetailView(product: product)
                    let hostingController = UIHostingController(rootView: detailView)
                    self?.navigationController?.pushViewController(hostingController, animated: true)
                }
            }
        }
        
        viewModel.onError = { error in
            print("Error fetching deals: \(error.localizedDescription)")
        }
    }
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell {
            cell.configure(with: viewModel.products[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.fetchProductDetail(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
