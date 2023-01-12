
enum MenuItem: Identifiable, CaseIterable {

  case workloadSheet
  case dashboard
  case projects
  case departments
  case employees
  case notifications
  case performanceReview
  case archive

  var id: Int { hashValue }
}
