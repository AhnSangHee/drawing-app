//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by 안상희 on 11/8/23.
//

import Combine
import Foundation

final class CanvasViewModel {
  enum Input {
    case rectangleButtonDidTapped
    case rectangleDidTapped(Drawable)
    case canvasViewDidTapped
  }

  enum Output {
    case rectangleDidCreated(rectangle: Rectangle)
    case rectangleDidSelected(rectangle: Rectangle)
    case canvasViewDidTapped
  }
  
  private(set) var rectangles = [Rectangle]()
  private var selectedRectangle: Rectangle?
  private var cancellables = Set<AnyCancellable>()
  private let output = PassthroughSubject<Output, Never>()
  
  func transform(input: AnyPublisher<Input, Never>, boundary: Boundary) -> AnyPublisher<Output, Never> {
    input.sink { [weak self] event in
      switch event {
      case .rectangleButtonDidTapped:
        self?.createRectangle(boundary)
        
      case let .rectangleDidTapped(rectangle):
        self?.selectRectangle(rectangle)
        
      case .canvasViewDidTapped:
        self?.deselect()
      }
    }
    .store(in: &cancellables)
    return output.eraseToAnyPublisher()
  }

  private func createRectangle(_ boundary: Boundary) {
    let factory = RectangleFactory()
    let rectangle = factory.create(boundary)
    rectangles.append(rectangle)
    output.send(.rectangleDidCreated(rectangle: rectangle))
  }
  
  private func selectRectangle(_ drawable: Drawable) {
    for index in 0..<rectangles.count {
      if rectangles[index].id == drawable.id {
        rectangles[index].isSelected = true
      }
    }
    
    for rectangle in rectangles {
      if rectangle.id == drawable.id {
        selectedRectangle = rectangle
        output.send(.rectangleDidSelected(rectangle: rectangle))
      }
    }
  }
  
  private func deselect() {
    output.send(.canvasViewDidTapped)
  }
}
