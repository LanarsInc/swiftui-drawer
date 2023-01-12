
import SwiftUI

public struct Drawer<Menu: View, Content: View>: View {

  @Binding private var isOpened: Bool

  private let menu: Menu
  private let content: Content

  // MARK: - Init

  public init(
    isOpened: Binding<Bool>,
    @ViewBuilder menu:  () -> Menu,
    @ViewBuilder content: () -> Content
  ) {
    _isOpened = isOpened
    self.menu = menu()
    self.content = content()
  }

  // MARK: - Body

  public var body: some View {
    ZStack(alignment: .leading) {
      content

      if isOpened {
        Color.clear
          .contentShape(Rectangle())
          .onTapGesture {
            if isOpened {
              isOpened.toggle()
            }
          }

        menu
          .transition(.move(edge: .leading))
          .zIndex(1)
      }
    }
    .animation(.spring(), value: isOpened)
    .environment(\.isDrawerOpened, $isOpened)
  }
}

struct Drawer_Previews: PreviewProvider {

  struct Preview: View {

    @State private var isOpened = true
    @State private var counter = 0

    var body: some View {
      Drawer(
        isOpened: $isOpened,
        menu: {
          ZStack {
            Color.gray

            Button("Hide") {
              isOpened = false
            }
          }
          .frame(width: 100)
        },
        content: {
          ZStack {
            Color.yellow

            Button("Open: \(counter)") {
              withAnimation {
                isOpened = true
                counter += 1
              }
            }
          }
          .ignoresSafeArea()
        }
      )
    }
  }

  static var previews: some View {
    Preview()
  }
}
