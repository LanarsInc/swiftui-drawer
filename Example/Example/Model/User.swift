
import Foundation
import SwiftUI

struct User {

  let name: String
  let position: String
  let imageName: String
  let isOnline: Bool
}

extension User {

  static let stub = User(name: "Alexey Podolyan", position: "CTO", imageName: "placeholder/user", isOnline: true)
}
