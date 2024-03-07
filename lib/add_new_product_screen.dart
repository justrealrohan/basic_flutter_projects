import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
bool addingNewProduct = false;

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
              paddedTextFormField(
                labelText: 'Product Name',
                hintText: 'Product Name',
                controller: _productNameController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Product Code',
                hintText: 'Product Code',
                controller: _productCodeController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Unit Price',
                hintText: 'Unit Price',
                controller: _productUnitPriceController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Product Quantity',
                hintText: 'Product Quantity',
                controller: _productQuantityController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Total Price',
                hintText: 'Total Price',
                controller: _productTotalPriceController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Product Image',
                hintText: 'Product Image',
                controller: _productImageController,
                validator: validateInput,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: addingNewProduct == false,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          createProduct();
                        }
                      },
                      child: const Text('Add Product'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  Widget paddedTextFormField({
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }

  void createProduct() async {
    addingNewProduct = true;
    setState(() {});
    Uri url = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Map<String, dynamic> params = {
      'ProductName': _productNameController.text.trim(),
      'ProductCode': _productCodeController.text.trim(),
      'UnitPrice': _productUnitPriceController.text.trim(),
      'Qty': _productQuantityController.text.trim(),
      'TotalPrice': _productTotalPriceController.text.trim(),
      'Img': _productImageController.text.trim(),
    };
    await post(url, body: jsonEncode(params), headers: {
      'Content-Type': 'application/json',
    });
    addingNewProduct = false;
    setState(() {
      _productNameController.clear();
      _productCodeController.clear();
      _productUnitPriceController.clear();
      _productQuantityController.clear();
      _productTotalPriceController.clear();
      _productImageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Added Successfully'),
        ),
      );
    });
  }
}
