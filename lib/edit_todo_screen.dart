import 'package:flutter/material.dart';

// ignore: camel_case_types
class editTodo extends StatefulWidget {
  const editTodo({super.key});

  @override
  State<editTodo> createState() => _editTodoState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _titleController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

// ignore: camel_case_types
class _editTodoState extends State<editTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Todo',
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
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Todo Added Successfully'),
                        ),
                      );
                    }
                  },
                  child: const Text('Edit Todo'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
