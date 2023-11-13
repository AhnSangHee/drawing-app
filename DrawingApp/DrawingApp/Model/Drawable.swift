//
//  Drawable.swift
//  DrawingApp
//
//  Created by 안상희 on 11/8/23.
//

import Foundation

protocol Drawable {
  var color: Color { get }
  var id: UUID { get }
  var point: Point { get }
}
