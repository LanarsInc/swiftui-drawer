
import SwiftUI

struct AnchorPreferenceKey<Value>: PreferenceKey {

  static var defaultValue: Anchor<Value>? {
    nil
  }

  static func reduce(value: inout Anchor<Value>?, nextValue: () -> Anchor<Value>?) {
    value = nextValue() ?? value
  }
}

