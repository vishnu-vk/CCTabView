//
//  CCTabItemSelection.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

class CCTabItemSelection<TabItem: CCTabItemProtocol>: ObservableObject{
    @Binding var selection: TabItem
    
    init(selection: Binding<TabItem>) {
        self._selection = selection
    }
}
