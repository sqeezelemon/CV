// CV
// ↳ URLPositionTracker.swift
//
// Created by @sqeezelemon

import Foundation
import SwiftUI


struct URLPositionTracker: ViewModifier {
  public static let coordinateSpaceName = "URLPositionTracker"
  
  let url: String
  let positions: URLPositions
  private let id = UUID()
  func body(content: Content) -> some View {
    content
      .overlay {
        GeometryReader { geo in
          Color.clear
            .onAppear {
              let frame = geo.frame(in: .named(URLPositionTracker.coordinateSpaceName))
              let rect = CGRect(
                x: frame.minX,
                y: 842 - frame.maxY,
                width: frame.width,
                height: frame.height)
              positions.add(url, in: rect, for: id)
            }
            .onDisappear {
              positions.remove(for: id)
            }
        }
      }
  }
}

extension View {
  @ViewBuilder func withUrlPositionTracking(url: String?,
                                            positions: URLPositions) -> some View {
    if let url {
      modifier(URLPositionTracker(url: url, positions: positions))
    } else {
      self
    }
  }
}
