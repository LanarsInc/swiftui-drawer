
import SwiftUI

private struct MenuBackgroundFadeInModifier: ViewModifier {

  private let identity: Bool
  private let anchor: Anchor<CGRect>?

  init(identity: Bool, anchor: Anchor<CGRect>?) {
    self.identity = identity
    self.anchor = anchor
  }

  func body(content: Content) -> some View {
    GeometryReader { proxy in
      let frame = effectiveFrame(using: proxy)

      content
        .frame(width: frame.width, height: frame.height)
        .position(x: frame.midX, y: frame.midY)
    }
  }

  private func effectiveFrame(using proxy: GeometryProxy) -> CGRect {
    guard let anchor, !identity else {
      return proxy.frame(in: .local)
    }

    return proxy[anchor]
  }
}

private struct MenuBackgroundFadeOutModifier: ViewModifier, Animatable {

  var animatableData: Double

  func body(content: Content) -> some View {
    content
  }
}

extension AnyTransition {

  static func menuBackgroundFadeIn(from anchor: Anchor<CGRect>?) -> AnyTransition {
    .asymmetric(
      insertion: .modifier(
        active: MenuBackgroundFadeInModifier(identity: false, anchor: anchor),
        identity: MenuBackgroundFadeInModifier(identity: true, anchor: anchor)
      ),
      removal: .modifier(
        active: MenuBackgroundFadeOutModifier(animatableData: 0),
        identity: MenuBackgroundFadeOutModifier(animatableData: 1)
      )
    )
  }
}
