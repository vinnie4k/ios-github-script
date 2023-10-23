//
//  UIFont+Extension.swift
//  A4
//
//  Created by Vin Bui on 8/3/23.
//

import UIKit

extension UIFont {
    
    var rounded: UIFont {
        guard let desc = self.fontDescriptor.withDesign(.rounded) else { return self }
        return UIFont(descriptor: desc, size: self.pointSize)
    }
    
}
