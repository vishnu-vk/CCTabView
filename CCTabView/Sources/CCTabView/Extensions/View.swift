//
//  View.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

struct CCTabItemViewModifier<TabItem: CCTabItemProtocol>: ViewModifier {
    @EnvironmentObject private var selectionObject: CCTabItemSelection<TabItem>
    let tab: TabItem
    func body(content: Content) -> some View {
        content
            .opacity(selectionObject.selection == tab ? 1.0 : 0.0)
            .preference(key: CCPreferenceKey.self, value: [tab])
    }
}

extension View{
    
    public func tabBarItem<Tab: CCTabItemProtocol>(tab: Tab) -> some View{
        self.modifier( CCTabItemViewModifier(tab: tab) )
    }
    
}

extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( CCRoundedRectangle(radius: radius, corners: corners) )
    }
}
