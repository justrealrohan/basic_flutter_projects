import 'dart:convert';
import 'package:basic_flutter_projects_1/edit_product_screen.dart';
import 'package:basic_flutter_projects_1/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  void initState() {
    super.initState();
    getProducts();
  }

  bool isLoading = false;

  List<ProductList> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'.toUpperCase()),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getProducts();
        },
        child: Visibility(
          visible: isLoading == false,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(products[index].img),
                ),
                title: Text(products[index].productName),
                subtitle: Wrap(
                  spacing: 15,
                  children: [
                    Text('Product Code: ${products[index].productCode}'),
                    Text('Qty: ${products[index].qty}'),
                    Text('Unit Price: ${products[index].unitPrice}'),
                    Text('Total Price: ${products[index].totalPrice}'),
                  ],
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditProductScreen(product: products[index]);
                                },
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 10),
                              Text('Edit'),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            _showDialog();
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.delete),
                              SizedBox(width: 10),
                              Text('Delete'),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const addNNewProductScreen();
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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content: const Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
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

  void getProducts() async {
    setState(() {
      isLoading = true;
    });

    final response = await get(
      Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final List<dynamic> productsJson =
          decodedResponse['data']; // replace 'data' with the actual key
      products =
          productsJson.map((json) => ProductList.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }

    setState(() {
      isLoading = false;
    });
  }
}
