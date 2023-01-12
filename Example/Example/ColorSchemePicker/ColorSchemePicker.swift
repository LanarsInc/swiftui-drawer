
import SwiftUI

private extension CGFloat {

  static let padding: Self = 2
  static let spacing: Self = 8

  static let elementWidth: Self = 132
  static let elementHeight: Self = 44
}

extension ColorScheme: CustomStringConvertible {

  public var description: String {
    switch self {
    case .light:
      return "Light"

    case .dark:
      return "Dark"

    @unknown default:
      return "Unknown"
    }
  }

  var icon: Image {
    switch self {
    case .dark:
      return Image("icon/colorScheme/dark")

    case .light:
      fallthrough

    @unknown default:
      return Image("icon/colorScheme/light")
    }
  }
}

struct ColorSchemePicker: View {

  @Binding private var selection: ColorScheme
  @Environment(\.menuAppearance) private var appearance
  @Namespace private var namespace
  @Namespace private var selectionBackgroundNamespace

  // MARK: - Init

  init(selection: Binding<ColorScheme>) {
    _selection = selection
  }

  // MARK: - Body

  var body: some View {
    VStack {
      content
    }
    .padding(2)
    .background {
      RoundedRectangle(cornerRadius: UIDimenion.cornerRadius)
        .fill(Color("color/controlBackground"))
    }
  }

  @ViewBuilder
  private var content: some View {
    switch appearance {
    case .default:
      HStack(spacing: .spacing) {
        ForEach(ColorScheme.allCases, id: \.self) { value in
          Button {
            withAnimation {
              selection = value
            }
          } label: {
            Label {
              Text(value.description)
            } icon: {
              value.icon
                .matchedGeometryEffect(id: value.description, in: namespace)
            }
          }
          .buttonStyle(ColorSchemeButtonStyle(selected: value == selection, backgroundNamespace: selectionBackgroundNamespace))
          .frame(width: .elementWidth, height: .elementHeight)
        }
      }

    case .compact:
      Button {
        withAnimation {
          selection.toggle()
        }
      } label: {
        selection
          .icon
          .foregroundColor(Color("color/selectionForeground"))
          .matchedGeometryEffect(id: selection.description, in: namespace)
      }
      .frame(width: .elementHeight, height: .elementHeight)
    }
  }
}

struct ColorSchemePicker_Previews: PreviewProvider {

  struct Preview: View {

    @State var colorScheme: ColorScheme = .light

    var body: some View {
      ColorSchemePicker(selection: $colorScheme)
    }
  }

  static var previews: some View {
    Preview()
  }
}
