import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String company;
  final String image;
  final Color color;
  const ProductCard(
    String s, {
    super.key,
    required this.name,
    required this.price,
    required this.company,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextTheme.of(context).titleMedium),
            SizedBox(height: 10),
            Text("₹\t$price", style: TextTheme.of(context).bodyMedium),
            SizedBox(height: 10),
            Center(child: Image(image: AssetImage(image), height: 160)),
          ],
        ),
      ),
    );
  }
}
