class Todo {
  int id;
  String name;
  String description;
  String completeBy;
  int priority;

  Todo(this.name, this.description, this.completeBy, this.priority): this.id=0;

  Todo.empty()
      : this.id = 0,
        this.name = "",
        this.description = "",
        this.completeBy = "",
        this.priority = 0;

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'completeBy': completeBy,
        'priority': priority,
      };

  static Todo fromMap(Map<String, dynamic> map) =>
      Todo(map['name'], map['description'], map['completeBy'], map['priority']);
}
