//
//  RectangleView.swift
//  DrawingApp
//
//  Created by 안상희 on 11/9/23.
//

import UIKit

protocol RectangleViewDelegate: AnyObject {
  func rectangleDidTapped(_ id: UUID)
}

final class RectangleView: UIView {
  private let rectangle: Drawable
  
  weak var delegate: RectangleViewDelegate?
  
  init(_ drawable: Drawable) {
    self.rectangle = drawable
    
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
