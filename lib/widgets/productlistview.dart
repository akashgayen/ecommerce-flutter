import 'dart:convert';
import 'package:ecom_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.number});
  final int number;

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
    String productURL = 'https://fakestoreapi.com/products/?limit=$number';
    final response = await http.get(Uri.parse(productURL));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products from fake API');
    }
  }

  ListView _productListView(data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 40.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    height: 22.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDFDFDF),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        4.sp,
                      ),
                      child: Image(
                        image: NetworkImage(
                          data[index].image,
                          scale: 6.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    data[index].title,
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '\$${data[index].price}',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
