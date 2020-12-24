//
//  TaskItemView.swift
//  TodoList
//
//  Created by wang ya on 2020/12/23.
//

import SwiftUI

struct TaskItemView: View {

    @EnvironmentObject var userData: UserData

    let task: Task
    @Binding var isEditing: Bool

    var body: some View {
        HStack {
            if self.isEditing {
                Image(systemName: "minus.circle").foregroundColor(.red).onTapGesture(count: 1, perform: {
                    self.delete()
                })
                NavigationLink(
                    destination: TaskEditView(task: task),
                    label: {
                        Text(task.title)
                    })
            } else {
                Button(action: {
                    self.toggleDone()
                }, label: {
                    Text(self.task.title)
                })
                Spacer()
                if task.isDone {
                    Image(systemName: "checkmark").foregroundColor(.green)
                }
            }
        }
    }

    private func toggleDone() {
        guard !self.isEditing else {
            return
        }
        guard let index = self.userData.tasks.firstIndex(where: { $0.id == self.task.id }) else {
            return
        }
        self.userData.tasks[index].isDone.toggle()
    }

    private func delete() {
        self.userData.tasks.removeAll { (task) -> Bool in
            task.id == self.task.id
        }
        if self.userData.tasks.isEmpty {
            self.isEditing = false
        }
    }

}
