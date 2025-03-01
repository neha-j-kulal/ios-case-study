//
//  Copyright © 2022 Target. All rights reserved.
//
import UIKit

extension UIFont {
    static var small: UIFont {
        UIFont(name: "helvetica", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
    }

    static var medium: UIFont {
        UIFont(name: "helvetica", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
    }

    static var largeBold: UIFont {
        UIFont(name: "helvetica-bold", size: 21.0) ?? UIFont.boldSystemFont(ofSize: 21.0)
    }
}
