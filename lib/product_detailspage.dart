import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cartprovider.dart';

class ProductDetailspage extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailspage({super.key, required this.product});

  @override
  State<ProductDetailspage> createState() => _ProductDetailspageState();
}

class _ProductDetailspageState extends State<ProductDetailspage> {
  int selectedSizeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: TextTheme.of(context).titleMedium,
        ),
        // ignore: deprecated_member_use
        backgroundColor: Color(0xFFD8D6FD),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              widget.product["name"] as String,
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage(widget.product["image"] as String)),
          ),
          Spacer(flex: 2),
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD8D6FD),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '₹ ${widget.product["price"]}',
                      style: TextTheme.of(context).bodyMedium!.copyWith(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        itemCount: (widget.product["size"] as List).length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSizeIndex = index;
                                });
                              },
                              child: Chip(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),

                                label: Text(
                                  (widget.product["size"] as List)[index]
                                      .toString(),
                                  style: TextTheme.of(context).bodyMedium!
                                      .copyWith(
                                        color: selectedSizeIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                      ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                side: BorderSide(color: Color(0xFFD8D6FD)),
                                backgroundColor: selectedSizeIndex == index
                                    ? Color(0xFF6A5ACD)
                                    : Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF6A5ACD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<Cartprovider>(
                          context,
                          listen: false,
                        ).addToCart({
                          "id": widget.product["id"],
                          "name": widget.product["name"],
                          "price": widget.product["price"],
                          "company": widget.product["company"],
                          "image": widget.product["image"],
                          "size": widget.product["size"][selectedSizeIndex],
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Product added to cart",
                              style: TextTheme.of(context).bodyMedium!.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            backgroundColor: Color(0xFF6A5ACD),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Add to Cart",
                            style: TextTheme.of(context).bodyMedium!.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
