//
//  CCDefaultTabBarStyle.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

class CCDefaultTabBarStyle: CCTabBarStyleProtocol {
    
    public var isFloating: Bool = false
    
    public var barColor: Color = Color(UIColor.systemBackground)
    
    public var barCornerRadius: CGFloat = .zero
    
    public var corners: UIRectCorner = .allCorners
    
    public var maxwidth: CGFloat = .infinity
    
    public var minheight: CGFloat = .zero

}
