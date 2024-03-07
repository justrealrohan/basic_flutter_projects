import 'dart:convert';

import 'package:basic_flutter_projects_1/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EditProductScreen extends StatefulWidget {
  final ProductList product;

  const EditProductScreen({super.key, required this.product});

  @override
  // ignore: library_private_types_in_public_api
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
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

  @override
  void initState() {
    super.initState();
    _productNameController.text = widget.product.productName;
    _productCodeController.text = widget.product.productCode;
    _productUnitPriceController.text = widget.product.unitPrice;
    _productQuantityController.text = widget.product.qty;
    _productTotalPriceController.text = widget.product.totalPrice;
    _productImageController.text = widget.product.img;
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              paddedTextFormField(
                labelText: 'Product Name',
                hintText: 'Enter Product Name',
                controller: _productNameController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Product Code',
                hintText: 'Enter Product Code',
                controller: _productCodeController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Unit Price',
                hintText: 'Enter Unit Price',
                controller: _productUnitPriceController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Product Quantity',
                hintText: 'Enter Product Quantity',
                controller: _productQuantityController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Total Price',
                hintText: 'Enter Total Price',
                controller: _productTotalPriceController,
                validator: validateInput,
              ),
              paddedTextFormField(
                labelText: 'Product Image URL',
                hintText: 'Enter Product Image URL',
                controller: _productImageController,
                validator: validateInput,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: isLoading == false,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          updateProduct();
                        }
                      },
                      child: const Text('Update Product'),
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

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    _productNameController.dispose();
    _productCodeController.dispose();
    _productUnitPriceController.dispose();
    _productQuantityController.dispose();
    _productTotalPriceController.dispose();
    _productImageController.dispose();
    super.dispose();
  }

  void updateProduct() async {
    isLoading = true;
    setState(() {});
    Uri url = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}');

    Map<String, dynamic> params = {
      "Img": _productImageController.text.trim(),
      "ProductCode": _productCodeController.text.trim(),
      "ProductName": _productNameController.text.trim(),
      "Qty": _productQuantityController.text.trim(),
      "TotalPrice": _productTotalPriceController.text.trim(),
      "UnitPrice": _productUnitPriceController.text.trim(),
      "id": widget.product.id,
    };
    await post(url, body: jsonEncode(params), headers: {
      'Content-Type': 'application/json',
    });
    isLoading = false;
    setState(() {
      _productNameController.clear();
      _productCodeController.clear();
      _productUnitPriceController.clear();
      _productQuantityController.clear();
      _productTotalPriceController.clear();
      _productImageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Updated Successfully'),
        ),
      );
      Navigator.pop(context, true);
    });
  }
}
