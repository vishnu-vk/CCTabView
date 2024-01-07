# CCTabView

![](https://img.shields.io/badge/platform-iOS-lightgrey)
![](https://img.shields.io/badge/iOS-14.0%2B-blue)
![](https://img.shields.io/badge/Swift-5-orange?logo=Swift&logoColor=white)

A flexible and customizable `TabView` implementation for `SwiftUI`, offering developers enhanced control and versatility in crafting dynamic tab-based navigation interfaces with a syntax familiar to `SwiftUI`.

## Table of contents

* [Requirements](#requirements)
* [Installation](#installation)
    * [Swift Package Manager](#swift-package-manager)
* [Usage](#usage)
    * [Customization](#customization)
* [Contribution](#contribution)
* [License](#license)

## Requirements

- SwiftUI
- iOS 14.0 or above

## Installation

**CCTabView** is available through [Swift Package Manager](https://github.com/apple/swift-package-manager)

### Swift Package Manager
- In Xcode select: 

  ```
  File > Swift Packages > Add Package Dependency...
  ```
  
- Then paste this URL: 

  ```
  https://github.com/vishnu-vk/CCTabView.git
  ```
  
## Usage

To start using `CCTabView` you have to create an enum which will implement `CCTabItemProtocol` protocol:

```swift
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
```

After that you will be able to create `CCTabView` instance:

```swift
struct ContentView: View {
   	@State var selection = tabs.home

    var body: some View {
        CCTabView(selection: $selection) {
            Text("Home")
                .tabBarItem(tab: tabs.home)
            Text("Favorites")
                .tabBarItem(tab: tabs.favorites)
            Text("Settings")
                .tabBarItem(tab: tabs.settings)
        }
    }
}
```

Without any modifiers, a `CCTabView` with default style will be created.

### Customization

`CCTabView` component is highly customizable. Create your own styles by conforming to `CCTabBarStyleProtocol` and `CCTabItemStyleProtocol`. Apply these styles using `tabBarStyle(_ style: CCTabBarStyleProtocol)` and `tabItemStyle(_ style: CCTabItemStyleProtocol)` modifiers for a truly personalized tab-based navigation experience.

![](https://github.com/vishnu-vk/CCTabView/blob/main/Images/show.png?raw=true)

## Contribution

Feel free to [open an issue](https://github.com/vishnu-vk/CCTabView/issues/new). Pull requests are also appreciated.

## License

**CCTabView** is under the terms and conditions of the MIT license.

```
MIT License

Copyright (c) 2024 Vishnu K

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

