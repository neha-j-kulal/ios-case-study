//
//  UIImage+Extension.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(from string: String?) {
        guard let string, let url = URL(string: string) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                debugPrint("Error downloading image: \(error)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                debugPrint("No data or failed to create image")
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }

}
