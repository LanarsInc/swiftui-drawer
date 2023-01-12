
import SwiftUI

private struct DrawerOpenedKey: EnvironmentKey {
  
  static var defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {

  public var isDrawerOpened: Binding<Bool> {
    get { self[DrawerOpenedKey.self] }
    set { self[DrawerOpenedKey.self] = newValue }
  }
}
