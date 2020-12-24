//
//  UserData.swift
//  TodoList
//
//  Created by wang ya on 2020/12/23.
//

import SwiftUI
import Combine

private let defaultTasks: [Task] = [
    Task(title: "买菜 🥦", isDone: false),
    Task(title: "看书 📖", isDone: false),
]

final class UserData: ObservableObject {

    let objectWillChange = PassthroughSubject<UserData, Never>()

    @UserDefaultValue(key: "tasks", defaultValue: defaultTasks)
    var tasks: [Task] {
        didSet {
            objectWillChange.send(self)
        }
    }

}
