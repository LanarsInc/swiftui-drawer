
import SwiftUI

private struct DrawerOpenedKey: EnvironmentKey {
  
  static var defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {

  /// Binding to an `isOpened` var of an enclosing `Drawer` (if any).
  /// In case there is no drawer to communicate with, it will return `false` and any changes to it won't have any effect.
  public var isDrawerOpened: Binding<Bool> {
    get { self[DrawerOpenedKey.self] }
    set { self[DrawerOpenedKey.self] = newValue }
  }
}
