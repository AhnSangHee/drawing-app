//
//  RectangleView.swift
//  DrawingApp
//
//  Created by 안상희 on 11/9/23.
//

import UIKit

protocol RectangleViewDelegate: AnyObject {
  func rectangleDidTapped(_ drawable: Drawable)
}

final class RectangleView: UIView {
  private let rectangle: Drawable
  
  weak var delegate: RectangleViewDelegate?
  
  init(_ drawable: Drawable) {
    self.rectangle = drawable
    
    super.init(frame: .zero)
    
    addTapGesture()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  private func addTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self , action: #selector(tapped))
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc private func tapped() {
    delegate?.rectangleDidTapped(rectangle)
  }
  
  func selected() {
    self.layer.borderWidth = 3
    self.layer.borderColor = UIColor.systemRed.cgColor
  }
  
  func deselected() {
    self.layer.borderWidth = 0
    self.layer.borderColor = UIColor.clear.cgColor
  }
}
