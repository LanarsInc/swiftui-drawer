
import SwiftUI

struct MenuBackground: View {

  private let colorScheme: ColorScheme

  // MARK: - Init

  init(colorScheme: ColorScheme) {
    self.colorScheme = colorScheme
  }

  // MARK: - Body

  var body: some View {
    RoundedRectangle(cornerRadius: UIDimenion.backgroundCornerRadius)
      .fill(Color("color/background"))
      .environment(\.colorScheme, colorScheme)
  }
}
