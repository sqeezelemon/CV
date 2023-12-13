// CV
// ↳ Experience.swift
//
// Created by @sqeezelemon

import Foundation

struct Experience: Decodable {
  let company: String
  let role: String
  let interval: String
  let details: String?
  let link: String?
}
