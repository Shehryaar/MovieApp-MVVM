//
//  UIView+Extensions.swift
//  MoviesApp
//
//  Created by Shehryar on 04/09/2023.
//

import UIKit

public extension UIView {
    
    /**
     Set a shadow on a UIView.
     - parameters:
     - color: Shadow color, defaults to black
     - opacity: Shadow opacity, defaults to 1.0
     - offset: Shadow offset, defaults to zero
     - radius: Shadow radius, defaults to 0
     */
    func setShadow(color: UIColor = .black,
                   opacity: Float = 1,
                   offset: CGSize = .zero,
                   radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
    
    func border(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    @IBInspectable private var cornerRadius: CGFloat {
        get {
            .zero
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
    
    @IBInspectable private var borderWidth: CGFloat {
        get {
            .zero
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable private var borderColor: UIColor {
        get {
            .black
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
}

