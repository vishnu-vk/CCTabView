//
//  CustomTabBarStyle.swift
//  Example
//
//  Created by Vishnu on 06/01/24.
//

import Foundation
import SwiftUI
import CCTabView

class CustomTabBarStyle: CCTabBarStyleProtocol {
    
    var isFloating: Bool = true
    
    var barColor: Color = Color.green
    
    var barCornerRadius: CGFloat = 30
    
    var corners: UIRectCorner = .allCorners
    
    var maxwidth: CGFloat = .infinity
    
    var minheight: CGFloat = .zero
    
}
