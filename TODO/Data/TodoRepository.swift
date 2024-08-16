import Foundation

class TodoRepository: ObservableObject {
    @Published private var tasks: [Todo] = []

    func addTask(_ task: Todo) {
        tasks.append(task)
    }

    func deleteTask(id: UUID) {
        tasks.removeAll { $0.id == id }
    }

    func toggleTaskCompletion(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func getTasks() -> [Todo] {
        return tasks
    }
}
