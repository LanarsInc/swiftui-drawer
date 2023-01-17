
import SwiftUI
import Drawer

struct ContentView: View {

  @State private var isOpened = true

  @Environment(\.colorScheme) private var colorScheme

  @State private var selection: MenuItem? = .dashboard
  @State var appearance: MenuAppearance = .default

  var body: some View {
    Drawer(
      isOpened: $isOpened,
      menu: {
        MenuView(selection: $selection)
      },
      content: {
        ZStack {
          Color("color/background")
            .environment(\.colorScheme, colorScheme.inverted())
            .edgesIgnoringSafeArea(.all)
            .animation(.default, value: colorScheme)

          Button {
            isOpened.toggle()
          } label: {
            Text("Open")
              .foregroundColor(Color("color/text"))
              .typographyStyle(.headline)
          }
        }
      }
    )
    .statusBarHidden(true)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
