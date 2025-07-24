//
//  UIView+IBInspectable.swift.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 18/06/25.
//

import UIKit

@IBDesignable
extension UIView {
    
    /// Corner radius
    @IBInspectable var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            // If you want subviews clipped to the rounded corners:
            layer.masksToBounds = newValue > 0
        }
    }
    
    /// Border width
    @IBInspectable var borderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    /// Border color
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cg = layer.borderColor else { return nil }
            return UIColor(cgColor: cg)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    /// Shadow radius, color, opacity, etc. (optional)
    @IBInspectable var shadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    @IBInspectable var shadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    @IBInspectable var shadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cg = layer.shadowColor else { return nil }
            return UIColor(cgColor: cg)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
}
