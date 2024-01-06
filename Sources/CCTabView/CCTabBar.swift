//
//  CCTabBar.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

struct CCTabBar<TabItem: CCTabItemProtocol>: View {
    @EnvironmentObject private var selectionObject: CCTabItemSelection<TabItem>
    let tabItems: [TabItem]
    let itemStyle: CCTabItemStyleProtocol

    @Namespace private var namespace
    
    @Binding var localSelection: TabItem
    
    var body: some View {
        HStack(){
            ForEach(tabItems.indices, id: \.self) { index in
                CCTabItem(item: tabItems[index], itemStyle: itemStyle, localSelection: $localSelection)
                if(index != tabItems.indices.last){
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct AddTabBarProperties: ViewModifier {
    let bgColor: Color
    let isFloating: Bool
    let radius: CGFloat
    let corners: UIRectCorner
    let width: CGFloat
    let height: CGFloat
    func body(content: Content) -> some View {
        if isFloating {
            return AnyView(
                content
                    .frame(minHeight: height)
                    .background(bgColor.cornerRadius(radius, corners: corners))
                    .padding()
                    .frame(maxWidth: width)
            )
        }else{
            return AnyView(
                content
                    .frame(height: 100)
                    .padding(.bottom)
                    .background(bgColor.cornerRadius(radius, corners: corners))
            )
        }
    }
}

extension CCTabBar{

    func addTabBarStyle(barStyle: CCTabBarStyleProtocol) -> some View {
        modifier(AddTabBarProperties(bgColor: barStyle.barColor, isFloating: barStyle.isFloating, radius: barStyle.barCornerRadius, corners: barStyle.corners, width: barStyle.maxwidth, height: barStyle.minheight))
    }
    
}
