// CV
// ↳ Contact.swift
//
// Created by @sqeezelemon

import Foundation

struct Contact: Decodable {
  let type: ContactType
  let title: String
  let link: String
  
  enum ContactType: String, Decodable {
    case linkedin
    case github
    case telegram
    case email
  }
}
