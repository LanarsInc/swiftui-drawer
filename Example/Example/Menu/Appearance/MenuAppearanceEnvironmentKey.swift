
import SwiftUI

private struct MenuAppearanceEnvironmentKey: EnvironmentKey {

  static var defaultValue: MenuAppearance = .default
}

extension EnvironmentValues {

  var menuAppearance: MenuAppearance {
    get {
      self[MenuAppearanceEnvironmentKey.self]
    }
    set {
      self[MenuAppearanceEnvironmentKey.self] = newValue
    }
  }
}

extension View {

  func preferredMenuAppearance(_ appearance: MenuAppearance) -> some View {
    environment(\.menuAppearance, appearance)
  }
}
