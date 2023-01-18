
import SwiftUI

struct MenuItemGeometryPreferenceKey: PreferenceKey {

  static var defaultValue: [MenuItem: Anchor<CGRect>] = [:]

  static func reduce(value: inout [MenuItem: Anchor<CGRect>], nextValue: () -> [MenuItem: Anchor<CGRect>]) {
    value.merge(nextValue()) { _, rhs in rhs }
  }
}
