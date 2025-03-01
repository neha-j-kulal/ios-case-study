//
//  DealDetailViewController.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import Foundation
import SwiftUI

import SwiftUI

///Product Detail Screen
struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        ScrollView {
            Divider()
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: product.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6))
                    } else if phase.error != nil {
                        Text(Constants.Message.failiedToLoadImage)
                            .foregroundColor(.red)
                    } else {
                        ProgressView()
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    HStack {
                        Text(product.saleCost)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.targetRed))
                        
                        Text(product.regularCost)
                            .font(.subheadline)
                            .foregroundColor(Color(.textLightGray))
                    }
                    .padding(.horizontal)
                    
                    Text(product.fulfillment)
                        .font(.subheadline)
                        .foregroundColor(Color(.textLightGray))
                        .padding(.horizontal)
                }
                .padding(.vertical)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(Constants.Text.productDetails)
                        .font(.emphasis)
                        .fontWeight(.bold)
                    
                    Text(product.description)
                        .font(.body)
                        .foregroundColor(Color(.textLightGray))
                }
                .padding()
            }
        }
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                    
                Button(action: {
                    print("Add to Cart button tapped")
                }) {
                    Text(Constants.ButtonText.addToCart)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(16)
                        .frame(width: geometry.size.width , height: 50)
                        .background(Color(.targetRed))
                        .cornerRadius(10)
                }
            }
        }
        .frame(height: 50)

        .navigationTitle(Constants.NavigationTitle.details)
        .navigationBarTitleDisplayMode(.inline)
    }
}
