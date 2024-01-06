//
//  CCPreferenceKey.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

struct CCPreferenceKey<TabItem: CCTabItemProtocol>: PreferenceKey {
    
    static var defaultValue: [TabItem] {
        .init()
    }
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value.append(contentsOf: nextValue())
    }
    
}
