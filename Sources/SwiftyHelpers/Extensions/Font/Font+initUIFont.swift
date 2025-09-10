//
//  Font+initUIFont.swift
//  SwiftyHelpers
//
//  Created by Sliman Desmars on 10/09/2025.
//

#if canImport(UIKit)
import UIKit

extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}

#endif
