
import SwiftUI

private extension CGFloat {

  static let headerBottomSpacing: Self = 16
}

struct MenuItemList: View {

  @Binding private var selection: MenuItem?
  private let user: User
  private let items: [MenuItem]
  private let onUserSelection: (() -> Void)?

  // MARK: - Init

  init(items: [MenuItem] = MenuItem.allCases, selection: Binding<MenuItem?>, user: User = .stub, onUserSelected: (() -> Void)? = nil) {
    self.items = items
    self.user = user
    _selection = selection
    self.onUserSelection = onUserSelected
  }

  // MARK: - Body

  var body: some View {
    VStack(alignment: .leading) {
      UserHeader(user: user)
        .onTapGesture {
          onUserSelection?()
        }

      Spacer()
        .frame(height: .headerBottomSpacing)

      itemsList
    }
    .animation(.spring(), value: selection)
  }

  @ViewBuilder
  private var itemsList: some View {
    VStack(alignment: .leading) {
      ForEach(items) { item in
        Button(
          action: {
            if selection == item {
              selection = nil
            } else {
              selection = item
            }
          },
          label: {
            Label(item: item)
          }
        )
        .buttonStyle(MenuItemButtonStyle(isSelected: item == selection))
      }
    }
  }
}

struct MenuItemList_Previews: PreviewProvider {

  private struct Preview: View {

    @State var selection: MenuItem? = .dashboard
    @State var appearance: MenuAppearance = .default

    var body: some View {
      MenuItemList(selection: $selection) {
        withAnimation(.spring()) {
          appearance.toggle()
        }
      }
      .fixedSize(horizontal: true, vertical: false)
      .menuAppearance(appearance)
    }
  }

  static var previews: some View {
    Preview()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
