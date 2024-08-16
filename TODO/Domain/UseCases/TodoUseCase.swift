import Foundation

protocol TodoUseCase {
    func addTask(title: String)
    func toggleTaskCompletion(id: UUID)
    func deleteTask(id: UUID)
    func getTasks() -> [Todo]
}

