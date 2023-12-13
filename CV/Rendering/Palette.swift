// CV
// ↳ Palette.swift
//
// Created by @sqeezelemon

import Foundation
import SwiftUI

struct Palette {
  /// ID of palette schema, unique
  public var schemaName: String
  public var colors: [NamedColor]
  
  class NamedColor: ObservableObject {
    public let name: String
    @Published public var color: Color
    
    init(name: String, color: Color) {
      self.name = name
      self.color = color
    }
  }
  
  func color(at index: Int) -> NamedColor {
    return index < colors.count ? colors[index] : NamedColor(name: "tmp", color: .clear)
  }
}
