//
//  Color.swift
//  DrawingApp
//
//  Created by 안상희 on 11/11/23.
//

import Foundation

enum Color: CaseIterable {
  case systemBlue
  case systemBrown
  case systemCyan
  case systemGreen
  case systemIndigo
  case systemMint
  case systemOrange
  case systemPink
  case systemPurple
  case systemTeal
  case systemYellow
  case systemGray
  case systemGray2
  case systemGray3
  case systemGray4
  case systemGray5
  case systemGray6
  
  static func random() -> Self {
    return Color.allCases.randomElement() ?? .systemCyan
  }
}
