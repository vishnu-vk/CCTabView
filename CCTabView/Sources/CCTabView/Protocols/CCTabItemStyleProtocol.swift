//
//  CCTabItemStyleProtocol.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

/*
 TitlePostion
 vertical - The title of TabItem will be displayed below the icon
 horizontal - The title of TabItem will be displayed along side the icon
 */
public enum TitlePosition {
    case vertical, horizontal
}

public protocol CCTabItemStyleProtocol{
    
    // Color of TabItem's icon
    var iconColor: Color { get set }
    // Height of TabItem's icon
    var iconHeight: CGFloat { get set }
    // Width of TabItem's icon
    var iconWidth: CGFloat { get set }
    // Font of TabItem's icon
    var iconFont: Font { get set }
    // Color of the TabItem's icon when it is selected
    var selectedIconColor: Color { get set }
    
    // Hide or Show the title of the TabItem's title
    var hideTitle: Bool { get set }
    // Color of TabItem's title
    var titleColor: Color { get set }
    // Set this to true if you want to show the TabItem's title if it is selected
    var showSelectedTitle: Bool { get set }
    // Color of TabItem's title when it is selected
    var selectedTitleColor: Color { get set }
    // Position of the TabItem's title
    var titlePosition: TitlePosition { get set }
    // Font of the TabItem's title
    var titleFont: Font { get set }
    
    // Set this to true if need to show a hightlight box when TabItem is selected
    var needHighLight: Bool { get set }
    // HightLight Color of TabItem when it is selected
    var highLightColor: Color { get set }
    // Corner radius of the highlight box of TabItem when it is selected
    var hightLightBoxCornerRadius: CGFloat { get set }
    
    // Padding for the TabItem
    var padding: CGFloat { get set }
    // Spacing between TabItem's title and icon
    var spacing: CGFloat { get set }
    
    // Set this to true if need to enable animation
    var enableAnimation: Bool { get set }
    // Animation of TabItem when selected
    var animation: Animation { get set }
    
}
