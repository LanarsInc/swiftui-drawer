
import SwiftUI

extension Binding {

  init(_ base: Binding<Value?>, `default`: Value) {
    self.init {
      base.wrappedValue ?? `default`
    } set: { newValue, transaction in
      base.transaction(transaction).wrappedValue = newValue
    }
  }
}
