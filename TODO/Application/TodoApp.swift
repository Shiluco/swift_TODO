//
//  TodoApp.swift
//  TODO
//
//  Created by 佐藤 墾 on 2024/08/16.
//

import SwiftUI

@main
struct TodoApp: App {
    @StateObject var viewModel = TodoListViewModel()

    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environmentObject(viewModel)
        }
    }
}
