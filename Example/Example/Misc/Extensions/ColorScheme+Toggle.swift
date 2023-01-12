
import SwiftUI

extension ColorScheme {

  mutating func toggle() {
    switch self {
    case .light:
      self = .dark

    case .dark:
      self = .light

    @unknown default:
      self = .light
    }
  }

  func inverted() -> Self {
    var copy = self
    copy.toggle()
    return copy
  }
}
