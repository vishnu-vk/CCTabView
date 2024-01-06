//
//  CCTabBarStyleProtocol.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

public protocol CCTabBarStyleProtocol {
    
    // Set this to true if needs a floating TabView
    var isFloating: Bool { get set }
    // Color of the TabBar
    var barColor: Color { get set }
    // Corner radius of TabBar
    var barCornerRadius: CGFloat { get set }
    // Corners of the TabBar for which the corner radius will be applied
    var corners: UIRectCorner { get set }
    // Max width of TabBar
    var maxwidth: CGFloat { get set }
    //Min height of TabBar
    var minheight: CGFloat { get set }
    
}
