//
//  UIFont.swift
//  Moazzi
//
//  Created by 유준용 on 2023/05/30.
//

import Foundation
import UIKit

extension UIFont {
    
    static func pretendard(weight: FontWeight, size: CGFloat) -> UIFont{
        switch weight{
        case .f100:
            return UIFont(name: "Pretendard-Thin", size: size)!
        case .f200:
            return UIFont(name: "Pretendard-ExtraLight", size: size)!
        case .f300:
            return UIFont(name: "Pretendard-Light", size: size)!
        case .f400:
            return UIFont(name: "Pretendard-Regular", size: size)!
        case .f500:
            return UIFont(name: "Pretendard-Medium", size: size)!
        case .f600:
            return UIFont(name: "Pretendard-SemiBold", size: size)!
        case .f700:
            return UIFont(name: "Pretendard-Bold", size: size)!
        default:
            return UIFont()
        }
    }
    
    static func chagePartOfTextColor(fullText: String, partText: String, color: UIColor) -> NSMutableAttributedString{
        let range = (fullText as NSString).range(of: partText)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        return attributedString
    }
}

enum FontWeight {
    case f100, f200, f300, f400, f500, f600, f700
}
