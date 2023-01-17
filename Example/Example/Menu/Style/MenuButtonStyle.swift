
import SwiftUI

private extension CGFloat {

  static let hSpacing: Self = 40
  static let contentHeight: Self = 48
}

struct MenuItemButtonStyle: ButtonStyle {

  var isSelected: Bool = false

  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .labelStyle(.menuLabel)
      .foregroundColor(configuration.isPressed || isSelected ? Color("color/selectionForeground") : Color("color/text"))
      .animation(.spring(), value: isSelected != configuration.isPressed)
      .frame(maxWidth: .infinity, minHeight: .contentHeight, alignment: .leading)
      .contentShape(Rectangle())
  }
}

struct MenuItemButtonStyle_Previews: PreviewProvider {

  struct Preview: View {

    @State var isSelected = false
    
    var body: some View {
      ZStack(alignment: .leading) {
        Color("color/background")

        VStack(alignment: .leading) {
          Button {
            withAnimation {
              isSelected.toggle()
            }
          } label: {
            Label(item: .archive)
          }
        }
        .buttonStyle(MenuItemButtonStyle(isSelected: isSelected))
      }
    }
  }

  static var previews: some View {
    Preview()
      .frame(width: 500, height: 100)
  }
}
