import 'package:ecom_flutter/models/cart.dart';
import 'package:ecom_flutter/productlistview.dart';
import 'package:ecom_flutter/screens/cartview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Cartview()));
                    },
                  ),
                  Text(ccart.count.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: const Center(child: ProductListView()));
  }
}
