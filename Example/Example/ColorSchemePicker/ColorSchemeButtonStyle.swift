
import SwiftUI

struct ColorSchemeButtonStyle: ButtonStyle {

  private var selected: Bool = false
  private var backgroundNamespace: Namespace.ID

  init(selected: Bool, backgroundNamespace: Namespace.ID) {
    self.selected = selected
    self.backgroundNamespace = backgroundNamespace
  }

  func makeBody(configuration: Configuration) -> some View {
    ZStack {
      if selected {
        background(for: configuration)
          .matchedGeometryEffect(id: "background", in: backgroundNamespace)
      } else {
        background(for: configuration)
      }

      configuration.label
        .foregroundColor(Color("color/selectionForeground"))
    }
    .animation(.spring(), value: selected)
    .animation(.spring(), value: configuration.isPressed)
  }

  @ViewBuilder
  private func background(for configuration: Configuration) -> some View {
    RoundedRectangle(cornerRadius: UIDimenion.cornerRadius)
      .fill(Color("color/controlForeground").opacity(backgroundOpacity(for: configuration)))
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }

  private func backgroundOpacity(for configuration: Configuration) -> Double {
    if selected {
      return configuration.isPressed ? 0.33 : 1
    } else {
      return configuration.isPressed ? 0.33 : 0
    }
  }
}
