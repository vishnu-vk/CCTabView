//
//  CCDefaultTabItemStyle.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

class CCDefaultTabItemStyle: CCTabItemStyleProtocol {
    
    public var iconColor: Color = Color.gray
    
    public var iconHeight: CGFloat = 30
    
    public var iconWidth: CGFloat = 30
    
    public var iconFont: Font = .subheadline
    
    public var selectedIconColor: Color = Color.accentColor
    
    public var hideTitle: Bool = false
    
    public var titleColor: Color = Color.gray
    
    public var showSelectedTitle: Bool = true
    
    public var selectedTitleColor: Color = Color.accentColor
    
    public var titlePosition: TitlePosition = .vertical
    
    public var titleFont: Font = .subheadline
    
    public var needHighLight: Bool = false
    
    public var highLightColor: Color = Color.clear
    
    public var hightLightBoxCornerRadius: CGFloat = .zero
    
    public var padding: CGFloat = 16
    
    public var spacing: CGFloat = 8
    
    public var enableAnimation: Bool = true
    
    public var animation: Animation = .linear
    
}
