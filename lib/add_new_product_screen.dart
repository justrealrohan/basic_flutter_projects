import 'package:flutter/material.dart';

// ignore: camel_case_types
class addNNewProductScreen extends StatefulWidget {
  const addNNewProductScreen({super.key});

  @override
  State<addNNewProductScreen> createState() => _addNNewProductScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _productNameController = TextEditingController();
final TextEditingController _productUnitPriceController =
    TextEditingController();
final TextEditingController _productTotalPriceController =
    TextEditingController();
final TextEditingController _productQuantityController =
    TextEditingController();
final TextEditingController _productCodeController = TextEditingController();
final TextEditingController _productImageController = TextEditingController();

// ignore: camel_case_types
class _addNNewProductScreenState extends State<addNNewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Product Name' : null,
                  controller: _productNameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    hintText: 'Product Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Product Code' : null,
                  controller: _productCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Product Code',
                    hintText: 'Product Code',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Unit Price' : null,
                  controller: _productUnitPriceController,
                  decoration: const InputDecoration(
                    labelText: 'Unit Price',
                    hintText: 'Unit Price',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Product Quantity' : null,
                  controller: _productQuantityController,
                  decoration: const InputDecoration(
                    labelText: 'Product Quantity',
                    hintText: 'Product Quantity',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Total Price' : null,
                  controller: _productTotalPriceController,
                  decoration: const InputDecoration(
                    labelText: 'Total Price',
                    hintText: 'Total Price',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Product Image' : null,
                  controller: _productImageController,
                  decoration: const InputDecoration(
                    labelText: 'Product Image',
                    hintText: 'Product Image',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('Add Product'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
