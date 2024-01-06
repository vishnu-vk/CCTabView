//
//  CCTabView.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

public struct CCTabView<TabItem: CCTabItemProtocol, Content: View>: View {
    
    private let selectedItem: CCTabItemSelection<TabItem>
    
    @State var localSelection: TabItem
    @State var tab: [TabItem] = []
    
    var barStyle: CCTabBarStyleProtocol = CCDefaultTabBarStyle()
    var itemStyle: CCTabItemStyleProtocol = CCDefaultTabItemStyle()
    
    let content: Content
    
    public init(selection: Binding<TabItem>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.selectedItem = .init(selection: selection)
        self._localSelection = State(initialValue: selection.wrappedValue)
    }
    
    public var body: some View {
        ZStack{
            content
                .edgesIgnoringSafeArea(.bottom)
            VStack(){
                Spacer()
                if !tab.isEmpty {
                    CCTabBar(
                        tabItems: tab,
                        itemStyle: itemStyle,
                        localSelection: $localSelection
                    )
                    .addTabBarStyle(barStyle: barStyle)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .environmentObject(self.selectedItem)
        .onPreferenceChange(CCPreferenceKey.self, perform: { value in
            self.tab = value
        })
    }
}


extension CCTabView{
    /**
     A function that will set the background color of the `CCTabView`.
     
     By passing the color, the background color of the `CCTabView` can be modified
     
     - Parameters:
        - color: background color that should be applied to `CCTabView`.
     
     - Returns:
        `CCTabView` with applied background color.
     */
    public func tabBarColor(_ color: Color) -> Self {
        var view = self
        view.barStyle.barColor = color
        return view
    }
    
    /**
     A function that will  make the `CCTabView` floating.
        
     The `CCTabView` is non floating by default. but can be changed to be a floating `CCTabView`
     
     - Parameters:
        - isFloating: background color that should be applied to `CCTabView`.
     
     - Returns:
        returnns a floating` CCTabView`
     */
    public func tabBarFloating(_ isFloating: Bool = true) -> Self {
        var view = self
        view.barStyle.isFloating = isFloating
        return view
    }
    
    /**
     A function that will set the corner radius of  the `CCTabView`.
     
     By default there is no corner radius applied.  The corner radius can be applied to only the specified corners
     
     - Parameters:
        - radius: corner radius that should be applied to `CCTabView`.
        - corners: corners that the corner radius should be applied.
     
     - Returns:
        `CCTabView` with applied corner radius
     */
    public func tabBarCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> Self {
        var view = self
        view.barStyle.barCornerRadius = radius
        view.barStyle.corners = corners
        return view
    }
    
    /**
     A function that will set the size of  the `CCTabView`.
     
     The `CCTabView` will adjust its height and width automatically. But we can set the minimum height and the maximum width of `CCTabView`
     
     - Parameters:
        - maxWidth: corner radius that should be applied to `CCTabView`.
        - minHeight: corners that the corner radius should be applied.
     
     - Returns:
        `CCTabView` with applied minimum height and maximum width
     */
    public func tabBarSize(maxWidth: CGFloat, minHeight: CGFloat) -> Self {
        var view = self
        view.barStyle.maxwidth = maxWidth
        view.barStyle.minheight = minHeight
        return view
    }
    
    /**
     A function to make the `CCTabItem` title visible.
     
     By default the `CCTabItem's` title is visible and will be displayed below the icon
     
     - Parameters:
        - show: set this boolean value to show or hide the title of `CCTabItem`
        - position: position of the title of `CCTabItem`
     
     - Returns:
        `CCTabView` with applied title properties
     */
    public func tabItemsShowTitle(_ show: Bool = true, position: TitlePosition = .horizontal) -> Self {
        var view = self
        view.itemStyle.hideTitle = !show
        view.itemStyle.showSelectedTitle = show
        view.itemStyle.titlePosition = position
        return view
    }
    
    /**
     A function to make the icon's height, width, padding around the icon and the spacing between the title and icon.
     
     By default the icon width and height is set to 30 points. Padding is 16 points and spacing is set to 8 points
     
     - Parameters:
        - width: width of the icon
        - height: height of the icon
        - spacing: space between the icon and title
        - padding: padding around the `CCTabItem`
     
     - Returns:
        `CCTabView` with applied `CCTabItem` properties
     */
    public func tabItemsSize(width: CGFloat, height: CGFloat, spacing: CGFloat, padding: CGFloat) -> Self {
        var view = self
        view.itemStyle.iconWidth = width
        view.itemStyle.iconHeight = height
        view.itemStyle.spacing = spacing
        view.itemStyle.padding = padding
        return view
    }
    
    /**
     A function to make the icon's height, width, padding around the icon and the spacing between the title and icon.
     
     By default the icon width and height is set to 30 points. Padding is 16 points and spacing is set to 8 points
     
     - Parameters:
        - width: width of the icon
        - height: height of the icon
        - spacing: space between the icon and title
        - padding: padding around the `CCTabItem`
     
     - Returns:
        `CCTabView` with applied `CCTabItem` properties
     */
    public func tabItemsColor(_ color: Color, titleColor: Color = Color.gray) -> Self {
        var view = self
        view.itemStyle.iconColor = color
        view.itemStyle.titleColor = titleColor
        return view
    }
    
    /**
     A function to the font of icon and title
     
     By default the font is set to `.subHeading` for both icon and title
     
     - Parameters:
        - font: font to be applied to the icon
        - titleFont: font to be applied to the title
     
     - Returns:
        `CCTabView` with applied fonts
     */
    public func tabItemsFont(_ font: Font, titleFont: Font = .headline) -> Self {
        var view = self
        view.itemStyle.iconFont = font
        view.itemStyle.titleFont = titleFont
        return view
    }

    /**
     A function to set the hight light propertices when the tab is selected
     
     By default the highlight is set to false. But we can set the hight light color and he corner radius of highlight box
     
     - Parameters:
        - highLight: set this to true if need to highlight a tab when selected
        - highLightColor: color of the highlight box
        - highLightBoxCornerRadius: corner radius of the highlight box
     
     - Returns:
        `CCTabView` with applied highlight propertices
     */
    public func tabItemsHighLight(_ highLight: Bool = false, highLightColor: Color = Color.clear, highLightBoxCornerRadius: CGFloat = 0) -> Self{
        var view = self
        view.itemStyle.needHighLight = highLight
        view.itemStyle.highLightColor = highLightColor
        view.itemStyle.hightLightBoxCornerRadius = highLightBoxCornerRadius
        return view
    }
    
    /**
     A function to set the color of the selected Tab's icon
     
     By default the colors of the selected Tab's icon is set to accent color
     
     - Parameters:
        - color: color of the selected Tab's icon
     
     - Returns:
        `CCTabView` with applied selected icon color
     */
    public func tabItemsSelectionColor(_ color: Color) -> Self{
        var view = self
        view.itemStyle.selectedIconColor = color
        return view
    }
    
    /**
     A function to show the selected Tab's title
     
     If you want to show the title of a tab only when it is selected you can set title to hidden using `showTitle()` and use this function to set the title visible when the tab is selected
     
     - Parameters:
        - show: set this to true if title needs to be visible is the Tab is selected
        - color: color of the title when selected
        - position: position of the title when selected
     
     - Returns:
        `CCTabView` with applied selected title propertices
     */
    public func tabItemsShowSelectedTitle(_ show: Bool = true, color: Color, position: TitlePosition = .horizontal) -> Self {
        var view = self
        view.itemStyle.showSelectedTitle = show
        view.itemStyle.selectedTitleColor = color
        view.itemStyle.titlePosition = position
        return view
    }
    
    /**
     A function to set animations
     
     By default the animation is set to true. so when ever a tab is selected it will be animated
     
     - Parameters:
        - enable: enable animation
        - animation: set this to your required animation.
     
     - Returns:
        `CCTabView` with applied selected animation propertices
     */
    public func tabItemsAnimation(_ enable: Bool = true, animation: Animation = .easeInOut) -> Self{
        var view = self
        view.itemStyle.enableAnimation = enable
        view.itemStyle.animation = animation
        return view
    }
    
    /**
     A function to set custom `CCTabBar` style
     
     Customize the entire TabBar by create a custom class which confirms to `CCTabBarStyleProtocol`
     
     - Parameters:
        - style: custom tab bar style class confirming to `CCTabBarStyleProtocol`
     
     - Returns:
        `CCTabView` with custom TabBar styles
     */
    public func tabBarStyle(_ style: CCTabBarStyleProtocol) -> Self {
        var view = self
        view.barStyle = style
        return view
    }
    
    /**
     A function to set custom `CCTabItem` style
     
     Customize the TabItem style by creating a custom class which confirms to `CCTabItemStyleProtocol`
     
     - Parameters:
        - style: custom TabItem style class confirming to `CCTabItemStyleProtocol`
     
     - Returns:
        `CCTabView` with custom TabView styles
     */
    public func tabItemStyle(_ style: CCTabItemStyleProtocol) -> Self {
        var view = self
        view.itemStyle = style
        return view
    }
    
}
