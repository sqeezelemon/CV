// CV
// ↳ String+Extensions.swift
//
// Created by @sqeezelemon

import Foundation
import SwiftUI

extension String {
  // For markdown support
  var asLocalized: LocalizedStringKey {
    LocalizedStringKey(self)
  }
}
