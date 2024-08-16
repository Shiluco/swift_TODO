import Foundation

struct Todo: Identifiable {
    let id: UUID
    let title: String
    var isCompleted: Bool
}

