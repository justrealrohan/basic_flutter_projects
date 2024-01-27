import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final TextEditingController _productTitleController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  List products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tech Store'.toUpperCase(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _productTitleController,
              decoration: const InputDecoration(
                hintText: 'Product Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _productPriceController,
                decoration: const InputDecoration(
                  hintText: 'Product Price',
                  border: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  products.add(
                    {
                      'title': _productTitleController.text,
                      'price': _productPriceController.text,
                    },
                  );
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'Add'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: products.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.black,
                    height: 1,
                    indent: 10,
                    endIndent: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      products[index]['title'].toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(products[index]['price'].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    leading: Image.network(
                      'https://www.bhphotovideo.com/images/images2500x2500/apple_z0w1_mrtr27_bh_mac_mini_late_2018_1441915.jpg',
                      width: 50,
                      height: 50,
                    ),
                    trailing: InkWell(
                      onTap: () {
                        products.remove(products[index]);
                        setState(() {});
                      },
                      child: const Icon(Icons.delete),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
