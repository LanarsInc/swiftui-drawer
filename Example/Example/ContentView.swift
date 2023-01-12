
import SwiftUI
import Drawer

struct ContentView: View {

  @State private var isOpened = true

  var body: some View {
    Drawer()
      .statusBarHidden(true)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
