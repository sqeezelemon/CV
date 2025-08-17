// CV
// ↳ View+Paper.swift
//
// Created by @sqeezelemon

import SwiftUI

extension CGSize {

    enum Paper {
        case a4
    }

}

extension View {

    func frame(paper: CGSize.Paper, landscape: Bool = false) -> some View {
        let size = paper.size(landscape)
        return self.frame(width: size.width, height: size.height, alignment: .topLeading)
    }

}

// MARK: - Helpers

extension CGSize.Paper {

    fileprivate func size(_ landscape: Bool) -> CGSize {
        let (small, big): (CGFloat, CGFloat) = switch self {
        case .a4:
            (595, 842)
        }
        if landscape {
            return CGSize(width: big, height: small)
        } else {
            return CGSize(width: small, height: big)
        }
    }
}
