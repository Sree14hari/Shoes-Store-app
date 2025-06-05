import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cartprovider.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(
      context,
    ).cartItems; // Access the cart items from the provider
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextTheme.of(context).titleMedium?.copyWith(fontSize: 25),
        ),
        // ignore: deprecated_member_use
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: cart.length, // Replace with your cart item count
        itemBuilder: (context, index) {
          final cartItem = cart[index]; // Replace with your cart item model
          return ListTile(
            title: Text(
              cartItem["name"].toString(), // Replace with your cart item name
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Size: ${cartItem["size"]}", // Replace with your cart item size
            ),
            leading: Image.asset(
              cartItem["image"]
                  .toString(), // Replace with your cart item image path
              width: 50,
              height: 50,
            ),
            trailing: IconButton(
              onPressed: () {
                Provider.of<Cartprovider>(
                  context,
                  listen: false,
                ).removeFromCart(cartItem);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${cartItem["name"]} removed from cart",
                      style: TextStyle(fontSize: 16),
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
