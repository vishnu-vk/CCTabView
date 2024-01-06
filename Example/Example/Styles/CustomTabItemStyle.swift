//
//  CustomTabItemStyle.swift
//  Example
//
//  Created by Vishnu on 06/01/24.
//

import Foundation
import SwiftUI
import CCTabView

class CustomTabItemStyle: CCTabItemStyleProtocol {
    
    var iconColor: Color = Color.white
    
    var iconHeight: CGFloat = 30
    
    var iconWidth: CGFloat = 30
    
    var iconFont: Font = .subheadline
    
    var selectedIconColor: Color = Color.black
    
    var hideTitle: Bool = false
    
    var titleColor: Color = Color.white
    
    var showSelectedTitle: Bool = true
    
    var selectedTitleColor: Color = Color.black
    
    var titlePosition: TitlePosition = .vertical
    
    var titleFont: Font = .subheadline
    
    var needHighLight: Bool = false
    
    var highLightColor: Color = Color.white
    
    var hightLightBoxCornerRadius: CGFloat = 10
    
    var padding: CGFloat = 16
    
    var spacing: CGFloat = 8
    
    var enableAnimation: Bool = true
    
    var animation: Animation = .linear
    
}
