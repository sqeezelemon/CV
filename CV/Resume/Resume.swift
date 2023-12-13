// CV
// ↳ Resume.swift
//
// Created by @sqeezelemon

import Foundation

struct Resume: Decodable {
  var name: String
  var summary: String
  var skillsets: [Skillset]
  var experiences: [Experience]
  var education: [Education]
  var projects: [Project]
  var contacts: [Contact]
}
