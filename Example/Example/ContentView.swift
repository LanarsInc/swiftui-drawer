
import SwiftUI
import Drawer

struct ContentView: View {

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
    .statusBarHidden(true)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
