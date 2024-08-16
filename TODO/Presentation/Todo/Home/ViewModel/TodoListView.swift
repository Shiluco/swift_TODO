import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    @State private var newTaskTitle: String = ""

    var body: some View {
        VStack {
            TextField("New Task", text: $newTaskTitle, onCommit: {
                viewModel.addTask(title: newTaskTitle)
                newTaskTitle = ""
            })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())

            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Button(action: {
                            viewModel.toggleTaskCompletion(id: task.id)
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
                .onDelete { indexSet in
                    if let index = indexSet.first {
                        viewModel.deleteTask(id: viewModel.tasks[index].id)
                    }
                }
            }
        }
        .navigationBarTitle("Todo List")
    }
}


