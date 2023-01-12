
import SwiftUI
import Drawer

struct ContentView: View {

  @State private var isOpened = true

  var body: some View {
    Drawer(
      isOpened: $isOpened,
      menu: {
        ZStack {
          Color.white

          Text("Menu")
        }
        .frame(width: 200)
      },
      content: {
        ZStack {
          Color("color/background")
            .edgesIgnoringSafeArea(.all)

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
