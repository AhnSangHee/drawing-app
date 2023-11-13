//
//  Drawing.swift
//  DrawingApp
//
//  Created by 안상희 on 11/8/23.
//

import Foundation

struct Drawing: Drawable, CustomDebugStringConvertible {
  var color: Color
  var id: UUID
  var point: Point
  
  init(color: Color, id: UUID, point: Point) {
    self.color = color
    self.id = id
    self.point = point
  }
  
  var debugDescription: String {
    return "🎨드로잉🎨 Color \(color), Id: \(id), Point: \(point)"
  }
}
