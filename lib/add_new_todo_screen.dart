import 'package:flutter/material.dart';
import 'package:basic_flutter_projects_1/todo_list_class.dart';

// ignore: camel_case_types
class addNewTodo extends StatefulWidget {
  const addNewTodo({super.key});

  @override
  State<addNewTodo> createState() => _addNewTodoState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

// ignore: camel_case_types
class _addNewTodoState extends State<addNewTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Todo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) =>
                    value!.isEmpty ? 'Title cannot be empty' : null,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter Todo Title',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _descriptionController,
                validator: (value) =>
                    value!.isEmpty ? 'Description cannot be empty' : null,
                maxLength: 100,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter Todo Description',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Todo todo = Todo(_titleController.text,
                          _descriptionController.text, DateTime.now());
                      Navigator.pop(context, todo);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Todo Added Successfully'),
                        ),
                      );
                    }
                  },
                  child: const Text('Add Todo'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
