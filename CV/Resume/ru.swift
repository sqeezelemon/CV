// CV
// ↳ ru.swift
//
// Created by:
// Alexander Nikitin - @sqeezelemon

import Foundation

extension Resume {
  static let ru = Resume(
    name: "Александр Никитин",
    subtitle: "iOS разработчик",
    imageUrl: Bundle.main.url(forResource: "me", withExtension: "jpg")!,
    sections: [
      //MARK: Образование
      Section(
        header: "Образование",
        items: [
          SectionItem(
            title: "Университет ИТМО",
            titleLink: nil,
            body: "Программирование и интернет технологии (2 курс)",
            leftAccessory: "2021-2025")
        ]),
      
      //MARK: Проекты
      Section(
        header: "Проекты",
        items: [
          SectionItem(
            title: "SwiftyLiveApi",
            titleLink: URL(string: "https://github.com/sqeezelemon/SwiftyLiveApi"),
            body: "Клиент для JSON Rest API",
            leftAccessory: "с 2021"
          ),
          SectionItem(
            title: "ConnectKit",
            titleLink: URL(string: "https://github.com/sqeezelemon/ConnectKit"),
            body: "Асинхронные клиенты для API на основе UDP/TCP сокетов по локальной сети на основе Network Framework",
            leftAccessory: "с 2022"
          ),
          SectionItem(
            title: "LogbookVisualizer",
            titleLink: URL(string: "https://github.com/sqeezelemon/misc/tree/main/LogbookVisualizer"),
            body: "Визуализация данных о полётах в онлайн авиасимуляторе с помощью CoreGraphics",
            leftAccessory: "2022"
          ),
          SectionItem(
            title: "Это резюме",
            titleLink: URL(string: "https://github.com/sqeezelemon/cv"),
            body: "SwiftUI, отрендеренный через ImageRenderer",
            leftAccessory: "2023")
        ]),
      
      //MARK: Навыки
      Section(
        header: "Навыки",
        items: [
          SectionItem(
            title: "Swift",
            titleLink: nil,
            body: "А так же C, C++, Python",
            leftAccessory: "Языки"),
          SectionItem(
            title: "Git, Bash",
            titleLink: nil,
            body: "А так же Charles Proxy, Jupyter Notebook",
            leftAccessory: "Утилиты")
        ]),
      
      //MARK: Контакты
      Section(
        header: "Контакты",
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
            leftAccessory: "Телега",
            asNonLink: true),
        ]),
    ])
}
