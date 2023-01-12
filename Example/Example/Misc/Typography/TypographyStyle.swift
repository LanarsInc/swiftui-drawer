
import SwiftUI

enum TypographyStyle {

  case headline
  case subheadline
  case title
  case title2

  private var fontName: String {
    switch self {
    case .headline:
      return "Gilroy-Bold"

    case .subheadline:
      return "Gilroy-Regular"

    case .title:
      return "Gilroy-Semibold"

    case .title2:
      return "Gilroy-Medium"
    }
  }

  private var fontTextStyle: Font.TextStyle {
    switch self {
    case .headline:
      return .headline

    case .subheadline:
      return .subheadline

    case .title:
      return .title

    case .title2:
        return .title2
    }
  }

  private var fontSize: CGFloat {
    switch self {
    case .headline:
      return 20

    case .subheadline:
      return 16

    case .title:
      return 16

    case .title2:
        return 16
    }
  }

  fileprivate func asFont() -> Font {
    Font.custom(fontName, size: fontSize, relativeTo: fontTextStyle)
  }
}

extension View {

  func typographyStyle(_ style: TypographyStyle) -> some View {
    font(style.asFont())
  }
}

extension Text {

  func typographyStyle(_ style: TypographyStyle) -> some View {
    font(style.asFont())
  }
}
