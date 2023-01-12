
import SwiftUI

enum MenuAppearance: String {

  case `default`, compact

  mutating func toggle() {
    switch self {
    case .default:
      self = .compact

    case .compact:
      self = .default
    }
  }
}
