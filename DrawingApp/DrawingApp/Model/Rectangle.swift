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
  
  init(color: Color, id: UUID, point: Point) {
    self.color = color
    self.id = id
    self.point = point
  }
  
  var debugDescription: String {
    return "🟩사각형🟩 Color \(color), Id: \(id), Point: \(point)"
  }
}
