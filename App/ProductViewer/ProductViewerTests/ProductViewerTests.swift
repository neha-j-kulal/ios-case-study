//
//  Copyright © 2022 Target. All rights reserved.
//

import XCTest
import SwiftUI
@testable import ProductViewer

final class ProductDetailViewTests: XCTestCase {

    var product: Product!

    override func setUp() {
        super.setUp()
        product = Product(
            id: 0,
            title: "Test Product",
            aisle: "r4",
            description: "This is a test description",
            imageUrl: "https://example.com/image.jpg",
            regularPrice: Price(amountInCents: 1299, currencySymbol: "$", displayString: "$12.99"),
            salePrice: Price(amountInCents: 1099, currencySymbol: "$", displayString: "$10.99"),
            fulfillment: "Pickup available",
            availability: "In Stock"
        )
    }

    func testProductModelInitialization() {
        XCTAssertEqual(product.title, "Test Product")
        XCTAssertEqual(product.saleCost, "$10.99")
        XCTAssertEqual(product.regularCost, "reg. $12.99")
        XCTAssertEqual(product.fulfillment, "Pickup available")
        XCTAssertEqual(product.description, "This is a test description")
        XCTAssertEqual(product.imageUrl, "https://example.com/image.jpg")
    }
    
    func testAsyncImageLoadingSuccess() {
        let expectation = expectation(description: "Image should load successfully")
        
        let url = URL(string: product.imageUrl)
        let dataTask = URLSession.shared.dataTask(with: url!) { data, _, error in
            XCTAssertNotNil(data, "Image data should not be nil")
            XCTAssertNil(error, "There should be no error when loading image")
            expectation.fulfill()
        }
        
        dataTask.resume()
        wait(for: [expectation], timeout: 5.0)
    }

    func testAsyncImageLoadingFailure() {
        let expectation = expectation(description: "Image should fail to load")

        let invalidUrl = URL(string: "https://invalid-url")
        let dataTask = URLSession.shared.dataTask(with: invalidUrl!) { data, _, error in
            XCTAssertNil(data, "Data should be nil for invalid URL")
            XCTAssertNotNil(error, "Error should be returned for invalid URL")
            expectation.fulfill()
        }

        dataTask.resume()
        wait(for: [expectation], timeout: 5.0)
    }
}
