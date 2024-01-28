import 'package:ecom_flutter/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartview extends StatefulWidget {
  const Cartview({super.key});

  @override
  CartviewState createState() => CartviewState();
}

class CartviewState extends State<Cartview> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart View [\$ ${ccart.totalPrice}]'),
        ),
        body: ccart.cartItems.isEmpty
            ? const Text('no items in your cart')
            : ListView.builder(
                itemCount: ccart.cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(ccart.cartItems[index].title),
                      subtitle: Text(ccart.cartItems[index].price.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          ccart.remove(ccart.cartItems[index]);
                        },
                      ),
                    ),
                  );
                },
              ));
  }
}
