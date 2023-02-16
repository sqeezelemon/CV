// CV
// ↳ en.swift
//
// Created by:
// Alexander Nikitin - @sqeezelemon

import Foundation

extension Resume {
  static let en = Resume(
    name: "Alexander Nikitin",
    subtitle: "iOS developer",
    imageUrl: Bundle.main.url(forResource: "me", withExtension: "jpg")!,
    sections: [
      //MARK: Образование
      Section(
        header: "Education",
        items: [
          SectionItem(
            title: "ITMO University",
            titleLink: nil,
            body: "Programming and internet technologies (year 2)",
            leftAccessory: "2021-2025")
        ]),
      
      //MARK: Проекты
      Section(
        header: "Projects",
        items: [
          SectionItem(
            title: "SwiftyLiveApi",
            titleLink: URL(string: "https://github.com/sqeezelemon/SwiftyLiveApi"),
            body: "Client for JSON Rest API",
            leftAccessory: "from 2021"
          ),
          SectionItem(
            title: "ConnectKit",
            titleLink: URL(string: "https://github.com/sqeezelemon/ConnectKit"),
            body: "Asyncronous clients for UDP/TCP based socket API built using Network Framework",
            leftAccessory: "from 2022"
          ),
          SectionItem(
            title: "LogbookVisualizer",
            titleLink: URL(string: "https://github.com/sqeezelemon/misc/tree/main/LogbookVisualizer"),
            body: "Online flight simulator traffic data visualised using CoreGraphics",
            leftAccessory: "2022"
          ),
          SectionItem(
            title: "This resume",
            titleLink: URL(string: "https://github.com/sqeezelemon/cv"),
            body: "SwiftUI rendered through ImageRenderer",
            leftAccessory: "2023")
        ]),
      
      //MARK: Навыки
      Section(
        header: "Skills",
        items: [
          SectionItem(
            title: "Swift",
            titleLink: nil,
            body: "Also C, C++, Python",
            leftAccessory: "Languages"),
          SectionItem(
            title: "Git, Bash",
            titleLink: nil,
            body: "Also Charles Proxy, Jupyter Notebook",
            leftAccessory: "Utilities")
        ]),
      
      //MARK: Контакты
      Section(
        header: "Contacts",
        items: [
          SectionItem(
            title: "@sqeezelemon",
            titleLink: URL(string: "https://linkedin.com/in/sqeezelemon"),
            body: nil,
            leftAccessory: "LinkedIn",
            asNonLink: true),
          SectionItem(
            title: "@sqeeze",
            titleLink: URL(string: "https://t.me/sqeeze"),
            body: nil,
            leftAccessory: "Telegram",
            asNonLink: true),
        ]),
    ])
}
