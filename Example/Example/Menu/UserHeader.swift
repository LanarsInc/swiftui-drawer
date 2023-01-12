
import SwiftUI

private extension CGFloat {

  static let hSpacing: Self = 24
  static let nameHeight: Self = 28
  static let positionHeight: Self = 20
  static let vSpacing: Self = 6
}

struct UserHeader: View {

  @Environment(\.menuAppearance) private var appearance

  let user: User

  var body: some View {
      Label(
        title: {
          if appearance == .default {
            VStack(alignment: .leading, spacing: .vSpacing) {
              Text(user.name)
                .typographyStyle(.headline)

              Text(user.position)
                .typographyStyle(.subheadline)
            }
            .foregroundColor(Color("color/text"))
          }
        },
        icon: {
          UserImage(imageName: user.imageName, isOnline: user.isOnline)
        }
      )
      .labelStyle(.menuLabel)
  }
}

struct UserProfileHeader_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      UserHeader(user: .stub)

      UserHeader(user: .stub)
        .preferredMenuAppearance(.compact)
    }
    .background(Color("color/background"))
    .previewLayout(.sizeThatFits)
  }
}
