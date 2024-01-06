//
//  ContentView.swift
//  Example
//
//  Created by Vishnu on 06/01/24.
//

import SwiftUI
import CCTabView

enum tabs: CCTabItemProtocol {
    case home, favorites, settings
    var icon: Image {
        switch self {
            case .home: return Image(systemName: "house")
            case .favorites: return Image(systemName: "heart")
            case .settings: return Image(systemName: "person")
        }
    }
    var title: String {
        switch self{
            case .home: return "Home"
            case .favorites: return "Favorites"
            case.settings: return "Settings"
        }
    }
}

struct ContentView: View {
    
    @State var selection = tabs.home
    let tabBarStyle = CustomTabBarStyle()
    let tabItemStyle = CustomTabItemStyle()
    
    var body: some View {
        example1
//        example2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    
    private var example1: some View {
        CCTabView(selection: $selection) {
            Text("Home")
                .tabBarItem(tab: tabs.home)
            Text("Favorites")
                .tabBarItem(tab: tabs.favorites)
            Text("Settings")
                .tabBarItem(tab: tabs.settings)
        }
        .tabBarColor(Color.green)
        .tabItemsShowTitle(true, position: .vertical)
        .tabItemsColor(Color.white)
        .tabItemsFont(.headline, titleFont: .subheadline)
        .tabItemsSize(width: 30, height: 30, spacing: 2, padding: 16)
        .tabItemsHighLight(true, highLightColor: Color.white, highLightBoxCornerRadius: 20)
        .tabItemsAnimation()
    }
    
    private var example2: some View {
        CCTabView(selection: $selection) {
            Text("Home")
                .tabBarItem(tab: tabs.home)
            Text("Favorites")
                .tabBarItem(tab: tabs.favorites)
            Text("Settings")
                .tabBarItem(tab: tabs.settings)
        }
        .tabBarStyle(tabBarStyle)
        .tabItemStyle(tabItemStyle)
    }
    
}
