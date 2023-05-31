//
//  UIFont.swift
//  Moazzi
//
//  Created by 유준용 on 2023/05/30.
//

import Foundation
import UIKit

extension UIFont {
    static func chagePartOfTextColor(fullText: String, partText: String  ,color: UIColor) -> NSMutableAttributedString{
        let range = (fullText as NSString).range(of: partText)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        return attributedString
    }
}
