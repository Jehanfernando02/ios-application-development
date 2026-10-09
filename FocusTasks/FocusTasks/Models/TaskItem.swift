struct TaskItem: Identifiable {
    var id = UUID()
    var title: String
    var priority: Priority
    var isComplete: Bool
}