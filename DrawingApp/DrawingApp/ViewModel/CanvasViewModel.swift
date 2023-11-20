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
  
  private var canvas = Canvas()
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
    canvas.addRectangle(rectangle)
    output.send(.rectangleDidCreated(rectangle: rectangle))
  }
  
  private func selectRectangle(_ drawable: Drawable) {
    for index in 0..<canvas.rectangles.count {
      if canvas.rectangles[index].id == drawable.id {
        output.send(.rectangleDidSelected(rectangle: canvas.rectangles[index]))
      }
    }
  }
  
  private func deselect() {
    output.send(.canvasViewDidTapped)
  }
}
