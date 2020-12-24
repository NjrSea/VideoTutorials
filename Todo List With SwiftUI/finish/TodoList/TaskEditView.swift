//
//  TaskEditView.swift
//  TodoList
//
//  Created by wang ya on 2020/12/23.
//

import SwiftUI

struct TaskEditView: View {

    @EnvironmentObject var userData: UserData

    private let task: Task
    private var draftTitle: State<String>

    var body: some View {
        let inset = EdgeInsets(top: -8, leading: -10, bottom: -7, trailing: -10)
        return VStack(alignment: .leading, spacing: 0, content: {
            TextField("输入标题...", text: draftTitle.projectedValue) { _ in
                self.updateTask()
            }
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.clear)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .padding(inset)
                    )
            )
            .padding(EdgeInsets(
                        top: 15 - inset.top,
                        leading: 20 - inset.leading,
                        bottom: 15 - inset.bottom,
                        trailing: 20 - inset.trailing)
            )
            Spacer()
        })
        .navigationBarTitle(Text("编辑任务 📝"))
    }

    init(task: Task) {
        self.task = task
        self.draftTitle = .init(initialValue: task.title)
    }

    private func updateTask() {
        guard let index = self.userData.tasks.firstIndex(of: self.task) else {
            return
        }
        guard !self.draftTitle.wrappedValue.isEmpty else {
            return
        }
        self.userData.tasks[index].title = self.draftTitle.wrappedValue
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView(task: Task(title: "测试任务", isDone: false))
    }
}
