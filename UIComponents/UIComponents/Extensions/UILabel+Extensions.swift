//
//  UILabel+Extensions.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 24.12.2023.
//

import UIKit

extension UILabel {
    public func contentWidth() -> CGFloat {
        guard let text = self.text else { return 0 }
        let fontAttributes = [NSAttributedString.Key.font: self.font ?? UIFont.systemFont(ofSize: 17.0)]
        let size = (text as NSString).size(withAttributes: fontAttributes)
        return size.width
    }
}
