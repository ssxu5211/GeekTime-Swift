//
//  UIColorExtension.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/7.
//

import Foundation
import UIKit

extension UIColor{
    static func hexColor(_ hexValue: Int,alphaValue:CGFloat)->UIColor{
        let red = CGFloat((hexValue & 0xFF0000) >> 16)/255.0
        let green =  CGFloat((hexValue & 0x00FF00) >> 8)/255.0
        let blue = CGFloat(hexValue & 0x0000FF)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: (alphaValue))
    }
    
    static func hexColor(_ hexValue: Int)->UIColor{
        return hexColor(hexValue, alphaValue: 1)
    }
    convenience init(_ hexValue: Int, alphaValue:CGFloat) {
        self.init(red: CGFloat((hexValue & 0xFF0000) >> 16)/255, green: CGFloat((hexValue & 0x00FF00) >> 8)/255, blue: CGFloat((hexValue & 0x0000FF)/255), alpha: CGFloat(alphaValue))
    }
    convenience init(_ hexValue: Int) {
        self.init(hexValue, alphaValue: 1)
    }
    
    func toImage()->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
