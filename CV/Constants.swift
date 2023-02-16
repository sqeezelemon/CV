// CV
// ↳ Constants.swift
//
// Created by:
// Alexander Nikitin - @sqeezelemon

import Foundation

struct Constants {
  static let resumes: [NamedResume] = [
    .init(name: "Russian", resume: .ru),
    .init(name: "English", resume: .en)
  ]
  static let columnSpacer: CGFloat = 12
  static let leftColumnSize: CGFloat = 80
}

struct NamedResume {
  static func == (lhs: NamedResume, rhs: NamedResume) -> Bool {
    return lhs.name == rhs.name
  }
  
  var name: String
  var resume: Resume
}

extension NamedResume: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
  }
}
