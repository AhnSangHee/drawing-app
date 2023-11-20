//
//  CanvasView.swift
//  DrawingApp
//
//  Created by 안상희 on 11/8/23.
//

import UIKit

protocol CanvasViewDelegate: AnyObject {
  func canvasDidTapped()
}

final class CanvasView: UIView {
  
  weak var delegate: CanvasViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addTapGesture()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func addTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self , action: #selector(tapped))
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc private func tapped() {
    delegate?.canvasDidTapped()
  }
}
