import 'package:basic_flutter_projects_1/add_new_todo_screen.dart';
import 'package:basic_flutter_projects_1/todo_list_class.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter_projects_1/edit_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

List<Todo> todoList = [];

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'To-Do List',
          ),
          centerTitle: true,
        ),
        body: Visibility(
          visible: todoList.isNotEmpty,
          replacement: const Center(
            child: Text('No Todos Yet'),
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
              height: 12,
              indent: 16,
              endIndent: 16,
            ),
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoList[index].title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todoList[index].description),
                    Text(
                      todoList[index].time.toString(),
                    ),
                  ],
                ),
                trailing: Wrap(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        onTapEditTodo(index);
                      },
                    ),
                    IconButton(
                      onPressed: () => showDeleteDialog(index),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onTapTodoFab,
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
        ));
  }

  void showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('Delete Todo'),
          content: const Text('Are you sure you want to delete this todo?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                todoList.removeAt(index);
                Navigator.pop(context);
                setState(() {});
              },
              child: const Text(
                'Yes, Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onTapTodoFab() async {
    final Todo? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const addNewTodo()),
    );
    if (result != null) {
      todoList.add(result);
      setState(() {});
    }
  }

  Future<void> onTapEditTodo(int index) async {
    final Todo? updatedTodo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => editTodo(
          todo: todoList[index],
        ),
      ),
    );
    if (updatedTodo != null) {
      todoList[index] = updatedTodo;
      setState(() {});
    }
  }
}
