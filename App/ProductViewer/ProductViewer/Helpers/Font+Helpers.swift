//
//  Font+Helpers.swift
//  ProductViewer
//
//  Created by Neha J on 01/03/25.
//  Copyright © 2025 Target. All rights reserved.
//

import SwiftUI

extension Font {
    static var title: Font {
        Font.custom("Helvetica", size: 18.0)
    }
    
    static var emphasis: Font {
        Font.custom("Helvetica-Bold", size: 18.0)
    }
    
    static var copy2: Font {
        Font.custom("Helvetica", size: 16.0)
    }
}
