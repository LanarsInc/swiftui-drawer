
import SwiftUI

private final class UILifecycleView: UIView {

  var onDidMoveToWindow: ((UIWindow?) -> Void)?
  var onOverrideUserInterfaceStyleDidChange: ((UIUserInterfaceStyle) -> Void)?

  override func didMoveToWindow() {
    super.didMoveToWindow()

    onDidMoveToWindow?(window)
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)

    if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
      onOverrideUserInterfaceStyleDidChange?(traitCollection.userInterfaceStyle)
    }
  }
}

private struct UIColorSchemeOverridingView: UIViewRepresentable {

  @Binding var overrideColorScheme: ColorScheme?

  // MARK: - UIViewRepresentable Lifecycle

  func makeUIView(context: Context) -> UILifecycleView {
    let view = UILifecycleView()
    view.isHidden = true
    view.frame = .zero

    view.onDidMoveToWindow = context.coordinator.overrideColorScheme
    view.onOverrideUserInterfaceStyleDidChange = context.coordinator.userInterfaceStyleDidChange

    return view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {
    context.coordinator.owner = self
    context.coordinator.overrideColorScheme(using: uiView.window)
  }

  static func dismantleUIView(_ uiView: UILifecycleView, coordinator: Coordinator) {
    uiView.onDidMoveToWindow = nil
    uiView.onOverrideUserInterfaceStyleDidChange = nil
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(owner: self)
  }

  // MARK: - Coordinator

  final class Coordinator {

    var owner: UIColorSchemeOverridingView

    // MARK: - Init

    init(owner: UIColorSchemeOverridingView) {
      self.owner = owner
    }

    func overrideColorScheme(using window: UIWindow?) {
      if
        let window,
        let style = owner.overrideColorScheme.map(UIUserInterfaceStyle.init),
        window.overrideUserInterfaceStyle != style
      {
        UIView.transition(with: window, duration: 0.22) {
          window.overrideUserInterfaceStyle = style
        }
      }
    }

    func userInterfaceStyleDidChange(_ style: UIUserInterfaceStyle) {
      let colorScheme = style != .unspecified ? ColorScheme(style) : nil
      if owner.overrideColorScheme != colorScheme {
        owner.overrideColorScheme = colorScheme
      }
    }
  }
}

extension View {

  /// Overrides window's color scheme to a specified value when non-nil. Also, communicates back in case value already overriden by external source.
  func overrideColorScheme(_ colorScheme: Binding<ColorScheme?>) -> some View {
    background(UIColorSchemeOverridingView(overrideColorScheme: colorScheme))
  }

  /// Overrides window's color scheme to a specified value when non-nil. Also, communicates back in case value already overriden by external source.
  func overrideColorScheme(_ userInterfaceStyle: Binding<UIUserInterfaceStyle>) -> some View {
    background(
      UIColorSchemeOverridingView(
        overrideColorScheme: Binding(
          get: {
            userInterfaceStyle.wrappedValue != .unspecified ? ColorScheme(userInterfaceStyle.wrappedValue) : nil
          },
          set: { value, transaction in
            userInterfaceStyle.transaction(transaction).wrappedValue = UIUserInterfaceStyle(value)
          }
        )
      )
    )
  }
}
