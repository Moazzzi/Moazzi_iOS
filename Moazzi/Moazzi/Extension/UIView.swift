//
//  UIView.swift
//  Moazzi
//
//  Created by 유준용 on 2023/05/31.
//

import Foundation
import UIKit

extension UIView {
    func nativeFeelingAnimation(duration: CGFloat ,xScale: CGFloat, yScale: CGFloat){
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: xScale, y: yScale)
        }) { (_) in
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = CGAffineTransform.identity.scaledBy(x: 1.01, y: 1.01)
                
            }) { (_) in
                UIView.animate(withDuration: duration, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                    self.transform = CGAffineTransform.identity
                })
            }
        }
    }
}
