//
//  TaskListView.swift
//  TodoList
//
//  Created by wang ya on 2020/12/23.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var userData: UserData

    @State var draftTitle: String = ""
    @State var isEditing: Bool = false

    var body: some View {
        NavigationView {
            List {
                TextField("创建新任务", text: $draftTitle, onCommit: self.createTask)
                ForEach(userData.tasks) { task in
                    TaskItemView(task: task, isEditing: $isEditing)
                }
            }
            .navigationBarTitle(Text("任务清单"))
            .navigationBarItems(trailing: Button(action: {
                self.isEditing.toggle()
            }, label: {
                if self.isEditing {
                    Text("完成").bold()
                } else {
                    Text("编辑")
                }
            }))
        }
    }

    private func createTask() {
        let newTask = Task(title: self.draftTitle, isDone: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.draftTitle = ""
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environmentObject(UserData())
    }
}
