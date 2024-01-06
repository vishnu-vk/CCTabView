//
//  CCTabItemProtocol.swift
//  CCTabView
//
//  Created by Vishnu on 03/01/24.
//

import Foundation
import SwiftUI

/*
 Each TabItems in the TabView should confirms to this protocol
 */
public protocol CCTabItemProtocol: Hashable{
    
    // icon of the tab item
    var icon: Image { get }
    
    // title of the tab item
    var title: String { get }
    
}
