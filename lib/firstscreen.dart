import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_card.dart';
import 'package:shop_app/product_detailspage.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  final List<String> categories = const [
    "All",
    "Adidas",
    "Nike",
    "Puma",
    "Reebok",
    "Under Armour",
  ];
  String selectedcategory = "All";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: GoogleFonts.lato(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 50, // Set a fixed height
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Optional: horizontal chips
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedcategory = categories[index];
                        });
                      },
                      child: Chip(
                        label: Text(categories[index]),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: selectedcategory == categories[index]
                              ? Color(0xFFD8D6FD)
                              : Colors.white,
                        ),
                        labelStyle: TextStyle(
                          color: selectedcategory == categories[index]
                              ? Colors.black
                              : Colors.grey,
                        ),
                        backgroundColor: selectedcategory == categories[index]
                            ? Color.fromRGBO(216, 214, 253, 0.8)
                            : Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: categories.length,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailspage(product: product),
                      ),
                    );
                  },
                  child: ProductCard(
                    "",
                    name: product['name'] as String,
                    price: product['price'].toString(),
                    company: product['company'] as String,
                    image: product['image'] as String,
                    color: index.isEven
                        ? Color.fromRGBO(216, 214, 253, 1)
                        : Color.fromRGBO(253, 214, 214, 1),
                  ),
                );
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
