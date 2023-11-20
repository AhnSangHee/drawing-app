//
//  Canvas.swift
//  DrawingApp
//
//  Created by 안상희 on 11/14/23.
//

import Foundation

struct Canvas {
  private(set) var rectangles = [Rectangle]()
  private var selectedRectangle: Rectangle?
  
  private mutating func append(_ element: Rectangle) {
    self.rectangles.append(element)
  }
  
  mutating func select(at index: Int) -> Rectangle? {
    let rectangle = rectangles[index]
    selectedRectangle = rectangle
    return selectedRectangle
  }
  
  mutating func addRectangle(_ element: Rectangle) {
    self.append(element)
  }
}
