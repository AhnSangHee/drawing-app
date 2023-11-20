//
//  Rectangle.swift
//  DrawingApp
//
//  Created by 안상희 on 11/7/23.
//

import Foundation

struct Rectangle: Drawable, CustomDebugStringConvertible {
  var color: Color
  var id: UUID
  var point: Point
  var isSelected: Bool = false
  
  init(color: Color, id: UUID, point: Point) {
    self.color = color
    self.id = id
    self.point = point
  }
  
  var debugDescription: String {
    return "🟩사각형🟩 Color \(color), Id: \(id), Point: \(point)"
  }
}

extension Rectangle: Equatable {
  static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
    return lhs.id == rhs.id
  }
}

extension Rectangle: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
