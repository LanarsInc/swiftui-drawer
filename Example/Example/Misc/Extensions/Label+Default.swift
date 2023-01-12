
import SwiftUI

extension Label where Title == Text, Icon == Image {

  static var logout: Self {
    Self("Logout", image: "icon/logout")
  }

  static var lightAppearance: Self {
    Self("Light", image: "icon/colorScheme/light")
  }

  static var darkAppearance: Self {
    Self("Dark", image: "icon/colorScheme/dark")
  }
}
