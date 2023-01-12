
import SwiftUI

private extension CGFloat {

  static let contentHeight: Self = 48
  static let spacing: Self = 24
}

struct MenuLabelStyle: LabelStyle {

  @Environment(\.menuAppearance) var appearance

  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: .spacing) {
      configuration.icon
        .frame(width: .contentHeight, height: .contentHeight, alignment: .center)

        configuration.title
          .typographyStyle(.title)
          .transition(.move(edge: .trailing).combined(with: .opacity))
    }
  }
}

extension LabelStyle where Self == MenuLabelStyle {

  static var menuLabel: Self {
    MenuLabelStyle()
  }
}

struct MenuLabelStyle_Previews: PreviewProvider {

  struct Preview: View {

    @State private var appearance: MenuAppearance = .default

    var body: some View {
      ZStack(alignment: .leading) {
        Color("color/background")

        Label(item: .dashboard)
          .labelStyle(.menuLabel)
          .preferredMenuAppearance(appearance)
          .overlay {
            Rectangle()
              .stroke(.blue, lineWidth: 1)
          }
          .onTapGesture {
            withAnimation {
              appearance.toggle()
            }
          }
      }
    }
  }

  static var previews: some View {
    Preview()
  }
}
