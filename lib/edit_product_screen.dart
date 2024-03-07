import 'package:flutter/material.dart';

// ignore: camel_case_types
class editProductScreen extends StatefulWidget {
  const editProductScreen({super.key});

  @override
  State<editProductScreen> createState() => _editProductScreenState();
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
class _editProductScreenState extends State<editProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'.toUpperCase()),
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
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('Update Product'),
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
}
