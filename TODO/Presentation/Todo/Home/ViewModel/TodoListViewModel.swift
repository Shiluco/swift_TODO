import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published private(set) var tasks: [Todo] = []
    private let repository = TodoRepository()

    init() {
        tasks = repository.getTasks()
    }

    func addTask(title: String) {
        let newTask = Todo(id: UUID(), title: title, isCompleted: false)
        repository.addTask(newTask)
        tasks = repository.getTasks()
    }

    func toggleTaskCompletion(id: UUID) {
        repository.toggleTaskCompletion(id: id)
        tasks = repository.getTasks()
    }

    func deleteTask(id: UUID) {
        repository.deleteTask(id: id)
        tasks = repository.getTasks()
    }
}

