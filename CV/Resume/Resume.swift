// CV
// ↳ Resume.swift
//
// Created by:
// Alexander Nikitin - @sqeezelemon

import Foundation

struct Resume {
  let name: String
  let subtitle: String
  let imageUrl: URL
  let sections: [Section]
}

struct Section {
  typealias Item = SectionItem
  
  let header: String
  let items: [Item]
}

struct SectionItem {
  let title: String
  let titleLink: URL?
  let body: String?
  let leftAccessory: String
  var asNonLink: Bool = false
}
