import 'dart:convert';

import 'package:ecom_flutter/models/cart.dart';
import 'package:ecom_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? data = snapshot.data;
          return _productListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<List<Product>> _getProducts() async {
    const productURL = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(productURL));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products from fake API');
    }
  }

  ListView _productListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var ccart = Provider.of<Cart>(context);
          return ListTile(
            title: Text(data[index].title),
            subtitle: Text(data[index].price.toString()),
            trailing: const Icon(Icons.add),
            onTap: () {
              ccart.add(data[index]);
            },
          );
        });
  }
}
