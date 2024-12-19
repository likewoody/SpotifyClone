//
//  ContentSizeCategory.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import Foundation
import SwiftUICore

struct ContentSizeViewModifier: ViewModifier {
    let limit: Int
    let minimumScaleFactor: CGFloat
    func body(content: Content) -> some View {
        content
            .lineLimit(limit)
            .minimumScaleFactor(minimumScaleFactor)
    }
}

struct ContentSizeUtility {
    @Environment(\.sizeCategory) var sizeCategory
    static var shared = ContentSizeUtility()
    
    
    private init() {}
}


// MARK: extension
extension View {
    func limitLineAndMiniumScaleFactor(_ limit: Int = 1, minimumScaleFactor: CGFloat = ContentSizeUtility.shared.sizeCategory.customMinScaleFactor) -> some View {
        modifier(ContentSizeViewModifier(limit: limit, minimumScaleFactor: minimumScaleFactor))
    }
}
extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            1.0
        case .large, .extraLarge, .extraExtraLarge:
            0.9
        default:
            0.9
        }
    }
}
