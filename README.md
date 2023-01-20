# Drawer

https://user-images.githubusercontent.com/829562/213693849-2cd9e1e7-8eaf-4110-bdcf-fb20917413ac.mp4


<p align="left" >
  <video src="https://github.com/LanarsInc/swiftui-drawer/blob/main/Assets/preview.mp4" alt="Drawer" title="Drawer">
</p>

## Overview and Motivation
This repo provides implementation of a Drawer that slides your menu from the left edge on top of a given content. Also, Example app provides a fully fledge side menu build on top of a Drawer. You can follow [series](https://lanars.com/blog/sidemenu-in-swiftui-part1) of [articles](https://lanars.com/blog/sidemenu-in-swiftui-part2) on our [blog](https://lanars.com/blog/) to get a hands-on experience of how it was build.

## Requirements
Platform | Min Deployment Target
:---: | :---:
iOS | 15.0

## Installation
You can add Drawer to an Xcode project by adding it as a package dependency.

1. From the File menu, select Add Packages...
2. Enter "https://github.com/lanarsinc/swiftui-drawer" into the package repository URL text field.
3. Then add `Drawer` directly to your application.

## Basic Usage
You can uses Drawer as a part of your hierarchy like that: 

```swift
struct ContentView: View {

  @State private var isOpened = true

  var body: some View {
    Drawer(
      isOpened: $isOpened,
      menu: {
        ZStack {
          Color.gray

          Button("Hide") {
            isOpened = false
          }
        }
        .frame(width: 100)
      },
      content: {
        ZStack {
          Color.yellow

          Button("Open") {
            withAnimation {
              isOpened = true
            }
          }
        }
        .ignoresSafeArea()
      }
    )
  }
}
```

Also, you may want to control whether menu is being opened and to close it from the menu itself. For this, use an @Environment(\.isDrawerOpened) wrapper to control status of a drawer.

## Things to be done
- Interactive presentation and dismissal via drag.
