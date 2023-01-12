
import SwiftUI

extension Label where Title == Text, Icon == Image {

  init(item: MenuItem) {
    switch item {
    case .workloadSheet:
      self.init("Workload Sheet", image: "icon/home")

    case .dashboard:
      self.init("Dashboard", image: "icon/dashboard")

    case .projects:
      self.init("Projects", image: "icon/projects")

    case .departments:
      self.init("Departments", image: "icon/departments")

    case .employees:
      self.init("Employees", image: "icon/employees")

    case .notifications:
      self.init("Notifications", image: "icon/notifications")

    case .performanceReview:
      self.init("Performance Review", image: "icon/performanceReview")

    case .archive:
      self.init("Archive", image: "icon/archive")
    }
  }
}

