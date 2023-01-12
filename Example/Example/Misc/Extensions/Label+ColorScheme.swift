
import SwiftUI

extension Label where Title == Text, Icon == Image {

  init(colorScheme: ColorScheme) {
    switch colorScheme {
    case .light:
      self.init("Light", image: "icon/colorScheme/light")

    case .dark:
      self.init("Dark", image: "icon/colorScheme/dark")

    @unknown default:
      self.init("Unknown", image: "icon/colorScheme/light")
    }
  }
}
