// CV
// ↳ CV.swift
//
// Created by @sqeezelemon

import SwiftUI

// MARK: - Root

struct CV {

    let name: String
    let title: String
    let contacts: [Contact]

//    @Section("Опыт")
    var experience: [Experience] = []

//    @Section("Образование")
    var education: [Education] = []

//    @Section("Skills")
    var skills: [Skills] = []

}

// MARK: - Common

extension CV {

    @propertyWrapper struct Section<Value> {
        var wrappedValue: [Value]
        let name: String

        init(wrappedValue: [Value], _ name: String) {
            self.wrappedValue = wrappedValue
            self.name = name
        }
    }

    struct Interval: Hashable {
        let from: String
        let to: String
    }

}

// MARK: - Contact

extension CV {

    enum Contact {
        case email(_ email: String)
        case linkedin(username: String)
        case github(username: String)
        case telegram(username: String)
    }

}

extension CV.Contact {
    var link: URL {
        let value: String = switch self {
        case .email(let email):
            "mailto://\(email)"
        case .linkedin(let username):
            "https://linkedin.com/in/\(username)"
        case .github(let username):
            "https://github.com/\(username)"
        case .telegram(let username):
            "https://t.me/\(username)"
        }
        return URL(string: value)!
    }
}

extension CV.Contact: Identifiable {
    var id: URL? { link }
}

// MARK: - Experience

extension CV {

    struct Experience {
        let company: String
        let title: String
        let interval: Interval
        let apps: [App]
        let bulletpoints: [String]

        struct App {
            let name: String
            let icon: Image
            let link: URL
        }
    }

}

// MARK: - Education

extension CV {

    struct Education {
        let university: String
        let program: String
        let interval: Interval
        let description: String
    }

}

// MARK: - Skills

extension CV {

    struct Skills {
        let type: String
        let skills: [String]
    }

}
