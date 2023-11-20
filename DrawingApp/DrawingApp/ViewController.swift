//
//  ViewController.swift
//  DrawingApp
//
//  Created by 안상희 on 11/5/23.
//

import Combine
import UIKit

final class ViewController: UIViewController {
  
  private let canvasView: CanvasView = {
    let view = CanvasView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let panelView: PanelView = {
    let view = PanelView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private var objects = [UUID : RectangleView]()
  private var selectedId: UUID?
  private let viewModel = CanvasViewModel()
  private let input = PassthroughSubject<CanvasViewModel.Input, Never>()
  private var cancellables = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bind()
    setLayout()
  }
  
  private func bind() {
    canvasView.delegate = self
    panelView.delegate = self
    
    let output = viewModel.transform(
      input: input.eraseToAnyPublisher(),
      boundary: Boundary(x: view.bounds.size.width, y: view.bounds.size.height - 100.0)
    )
    
    output
      .sink { [weak self] event in
        guard let self = self else { return }
        switch event {
        case let .rectangleDidCreated(rectangle):
          let rectangleView = RectangleView(rectangle)
          rectangleView.delegate = self
          
          let size = 100.0
          rectangleView.frame = CGRect(x: rectangle.point.x, y: rectangle.point.y, width: size, height: size)
          rectangleView.backgroundColor = UIColor.colorToSystemColor(rectangle.color)
          canvasView.addSubview(rectangleView)
          objects[rectangle.id] = rectangleView
          
        case let .rectangleDidSelected(rectangle: rectangle):
          if let selectedId = selectedId {
            objects[selectedId]?.deselected()
          }
          selectedId = rectangle.id
          objects[rectangle.id]?.selected()
          
        case .canvasViewDidTapped:
          if let selectedId = selectedId {
            objects[selectedId]?.deselected()
          }
          selectedId = nil
        }
      }
      .store(in: &cancellables)
  }
  
  private func setLayout() {
    view.backgroundColor = .white
    view.addSubviews([canvasView, panelView])
    
    NSLayoutConstraint.activate([
      canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      canvasView.topAnchor.constraint(equalTo: view.topAnchor),
      canvasView.bottomAnchor.constraint(equalTo: panelView.topAnchor),
      
      panelView.widthAnchor.constraint(equalToConstant: 200),
      panelView.heightAnchor.constraint(equalToConstant: 100),
      panelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      panelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
    ])
  }
}

extension ViewController: PanelViewDelegate {
  func rectangleButtonDidTapped() {
    input.send(.rectangleButtonDidTapped)
  }
  
  func drawingButtonDidTapped() { }
}

extension ViewController: RectangleViewDelegate {
  func rectangleDidTapped(_ drawable: Drawable) {
    input.send(.rectangleDidTapped(drawable))
  }
}

extension ViewController: CanvasViewDelegate {
  func canvasDidTapped() {
    input.send(.canvasViewDidTapped)
  }
}
