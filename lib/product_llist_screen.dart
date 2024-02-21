import 'package:flutter/material.dart';
import 'add_new_product_screen.dart';

// ignore: camel_case_types
class productListScreen extends StatefulWidget {
  const productListScreen({
    super.key,
  });

  @override
  State<productListScreen> createState() => _productListScreenState();
}

// ignore: camel_case_types
class _productListScreenState extends State<productListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'.toUpperCase()),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1926&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            ),
            title: const Text('Product Name'),
            subtitle: const Wrap(
              spacing: 15,
              children: [
                Text('Product Description'),
                Text('Product Price'),
                Text('Product Quantity'),
                Text('Product Code'),
              ],
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 10),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return addNNewProductScreen();
              },
            ),
          );
        },
        label: const Row(
          children: [
            Icon(Icons.add),
            SizedBox(width: 10),
            Text('Add Product'),
          ],
        ),
      ),
    );
  }
}
