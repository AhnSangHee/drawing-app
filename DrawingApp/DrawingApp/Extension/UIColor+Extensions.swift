//
//  UIColor+Extensions.swift
//  DrawingApp
//
//  Created by 안상희 on 11/7/23.
//

import UIKit.UIColor

extension UIColor {
  static func colorToSystemColor(_ color: Color) -> UIColor {
    switch color {
    case .systemBlue:
      return .systemBlue
      
    case .systemBrown:
      return .systemBrown
      
    case .systemCyan:
      return .systemCyan
      
    case .systemGreen:
      return .systemGreen
      
    case .systemIndigo:
      return .systemIndigo
      
    case .systemMint:
      return .systemMint
      
    case .systemOrange:
      return .systemOrange
      
    case .systemPink:
      return .systemPink
      
    case .systemPurple:
      return .systemPurple
      
    case .systemTeal:
      return .systemTeal
      
    case .systemYellow:
      return .systemYellow
      
    case .systemGray:
      return .systemGray
      
    case .systemGray2:
      return .systemGray2
      
    case .systemGray3:
      return .systemGray3
      
    case .systemGray4:
      return .systemGray4
      
    case .systemGray5:
      return .systemGray5
      
    case .systemGray6:
      return .systemGray6
    }
  }
}
