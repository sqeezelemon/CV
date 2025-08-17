// CV
// ↳ ResumeView.swift
//
// Created by @sqeezelemon

import SwiftUI

struct ResumeView: View {

    let cv: CV

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            section("Опыт", values: cv.experience) {
                experience($0)
            }
            section("Образование", values: cv.education) {
                education($0)
            }
            section("Навыки", values: cv.skills) {
                skills($0)
            }
            Spacer()
            splitLayout(
                left: { Color.clear },
                right: {
                    Text("Кстати, этот PDF - SwiftUI, исходники тут")
                        .foregroundStyle(.secondary)
                        .withPdfUrl(
                            URL(string: "https://github.com/sqeezelemon/CV")!
                        )
                }
            )
        }
        .padding(50)
    }

}

// MARK: - Header

extension ResumeView {

    private var header: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(cv.name)
                    .font(.Style.name)
                Text(cv.title)
                    .font(.Style.title)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                ForEach(cv.contacts) { contact in
                    Text(contact.displayName)
                        .font(.Style.details)
                        .withPdfUrl(contact.link)
                }
            }
        }
    }

}

extension CV.Contact {

    fileprivate var displayName: AttributedString {
        let value: String = switch self {
        case .email(let email):
            email
        case .linkedin(let username):
            "**in**/\(username)"
        case .github(let username):
            "**gh**/\(username)"
        case .telegram(let username):
            "**t.me**/\(username)"
        }
        return (try? AttributedString(markdown: value)) ?? ""
    }

}

// MARK: - Experience

extension ResumeView {

    func experience(_ value: CV.Experience) -> some View {
        intervalLayout(value.interval) {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(value.company) — \(value.title)")
                    .font(.Style.important)

                HStack(spacing: 10) {
                    ForEach(value.apps) { app in
                        HStack(alignment: .center, spacing: 2) {
                            app.icon
                                .resizable()
                                .frame(width: 16, height: 16)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                            Text(app.name)
                        }
                        .withPdfUrl(app.link)
                    }
                }

                VStack(alignment: .leading, spacing: 0) {
                    ForEach(value.bulletpoints, id: \.self) { bulletpoint in
                        Text("— \(bulletpoint)")
                            .font(.Style.details)
                    }
                }
            }
        }
    }

}

extension CV.Experience: Identifiable {
    var id: CV.Interval { interval }
}

extension CV.Experience.App: Identifiable {
    var id: String { name }
}

// MARK: - Education

extension ResumeView {

    func education(_ value: CV.Education) -> some View {
        intervalLayout(value.interval) {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(value.university) — \(value.program)")
                    .font(.Style.important)
                Text(value.description)
                    .font(.Style.details)
            }
        }
    }

}

extension CV.Education: Identifiable {
    var id: String { university + program }
}

// MARK: - Skills

extension ResumeView {

    func skills(_ value: CV.Skills) -> some View {
        splitLayout(
            left: {
                Spacer()
            },
            right: {
                Text(value.displayText)
            }
        )
    }

}

extension CV.Skills: Identifiable {
    var id: String { type }
}

extension CV.Skills {
    fileprivate var displayText: AttributedString {
        let value = "**\(type)**: \(skills.joined(separator: ", "))"
        return (try? AttributedString(markdown: value)) ?? ""
    }
}

// MARK: - Common

extension ResumeView {

    private func splitLayout(
        left: () -> some View,
        right: () -> some View
    ) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            left()
                .frame(width: 68, alignment: .center)
            right()
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }

    private func intervalLayout(_ interval: CV.Interval, body: () -> some View) -> some View {
        splitLayout(
            left: {
                Text("\(interval.from)\n\(interval.to)")
                    .font(.Style.interval)
                    .multilineTextAlignment(.trailing)
                    .foregroundStyle(.secondary)
            },
            right: body
        )
    }

}

// MARK: - Section

extension ResumeView {

    func section<Value: Identifiable, Content: View>(
        _ name: String,
        values: [Value],
        content: @escaping (Value) -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            sectionHeader(name)
                .font(.Style.important)
                .padding(.top, 10)
            ForEach(values) { value in
                content(value)
            }
        }
    }

    private func sectionHeader(_ name: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 4) {
            Rectangle()
                .frame(width: 66, height: 2)
            Text(name)
            Rectangle()
                .frame(height: 2)
        }
    }

}

// MARK: - Helpers

extension Font {
    enum Style {
        static let name: Font = .system(size: 30, weight: .bold)
        static let title: Font = .system(size: 17, weight: .regular)
        static let interval: Font = .system(size: 13, design: .monospaced)
        static let important: Font = .system(size: 17, weight: .bold)
        static let details: Font = .system(size: 13, weight: .regular)
    }
}

// MARK: - Preview

#Preview {
    ResumeView(cv: .me)
        .frame(paper: .a4)
}
