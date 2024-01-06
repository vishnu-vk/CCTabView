//
//  CCTabItem.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

struct CCTabItem<TabItem: CCTabItemProtocol>: View {
    @EnvironmentObject private var selectionObject: CCTabItemSelection<TabItem>
    
    let item: TabItem
    let itemStyle: CCTabItemStyleProtocol
    @Binding var localSelection: TabItem
    
    @Namespace private var namespace
    
    var body: some View {
        HStack{
            if itemStyle.titlePosition == .horizontal {
                HStack(spacing: itemStyle.spacing){
                    ItemView(item: item)
                }
            }else{
                VStack(spacing: itemStyle.spacing){
                    ItemView(item: item)
                }
            }
        }
        .padding(itemStyle.padding)
        .background(
            ZStack{
                if(localSelection == item && itemStyle.needHighLight){
                    RoundedRectangle(cornerRadius: itemStyle.hightLightBoxCornerRadius)
                        .fill(itemStyle.highLightColor)
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
        .onTapGesture {
            self.selectionObject.selection = item
            if(itemStyle.enableAnimation){
                withAnimation(itemStyle.animation){
                    self.localSelection = item
                }
            }else{
                self.localSelection = item
            }
        }
    }
    
}

extension CCTabItem {
    private func ItemView(item: TabItem) -> some View {
        Group{
            item.icon
                .resizable()
                .scaledToFit()
                .font(itemStyle.iconFont)
                .frame(width: itemStyle.iconWidth, height: itemStyle.iconHeight)
                .foregroundColor(localSelection == item ? itemStyle.selectedIconColor : itemStyle.iconColor)
            if((!itemStyle.hideTitle) || (itemStyle.showSelectedTitle && localSelection == item)){
                Text(item.title)
                    .font(itemStyle.titleFont)
                    .lineLimit(1)
                    .foregroundColor(localSelection == item ? itemStyle.selectedTitleColor : itemStyle.titleColor)
            }
        }
    }
}
