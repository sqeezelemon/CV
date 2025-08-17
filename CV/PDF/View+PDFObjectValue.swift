// CV
// ↳ View+PDFObjectValue.swift
//
// Created by @sqeezelemon

import SwiftUI

// MARK: - Object Value

enum PDFObjectValue {
    case url(URL)
}

typealias PDFObjects = [(frame: CGRect, value: PDFObjectValue)]

// MARK: - Getter

extension View {

    func withPdfObjectTracking(to frames: Binding<PDFObjects>) -> some View {
        self
            .coordinateSpace(name: PDFObjectTrackingModifier.coordinateSpaceName)
            .overlayPreferenceValue(PDFObjectTrackingKey.self) { preferences in
                Color.clear
                    .onChange(of: preferences.keys, initial: true) {
                        frames.wrappedValue = preferences.values.map {
                            ($0.anchor, $0.value)
                        }
                    }
            }
    }

}

// MARK: - Setter

extension View {

    func withPdfValue(_ value: PDFObjectValue) -> some View {
        self.modifier(PDFObjectTrackingModifier(value: value))
    }

    func withPdfUrl(_ url: URL) -> some View {
        self.withPdfValue(.url(url))
    }

}

// MARK: - PreferenceKey

fileprivate struct PDFObjectTrackingKey: PreferenceKey {

    typealias Value = [String : Object]

    struct Object {
        let anchor: CGRect
        let value: PDFObjectValue
    }

    static var defaultValue: Value = [:]

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }

}

// MARK: - Modifier

fileprivate struct PDFObjectTrackingModifier: ViewModifier {

    fileprivate static let coordinateSpaceName = UUID().uuidString

    let value: PDFObjectValue
    let id = UUID()

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { geo in
                Color.clear
                    .anchorPreference(
                        key: PDFObjectTrackingKey.self,
                        value: .bounds
                    ) { anchor in
                        let value = PDFObjectTrackingKey.Object(
                            anchor: geo.frame(in: .named(Self.coordinateSpaceName)),
                            value: value
                        )
                        return [id.uuidString : value]
                    }
            }
        }
    }
}
