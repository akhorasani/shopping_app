import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/screens/Cart_Details.dart';
import 'package:shopping_app/widgets/available_size.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 220,
                width: 220,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red.shade100),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$' + '${product.price}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available Size",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(children: [
                  AvailableSize(size: "US 6"),
                  AvailableSize(size: "US 7"),
                  AvailableSize(size: "US 8"),
                  AvailableSize(size: "US 9"),
                ]),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available Colors",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
        // notchMargin: 0.0,
        padding: EdgeInsets.all(0),
        // clipBehavior: Clip.none,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
              color: Colors.purple.shade400,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' '${product.price}',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    provider.toggleProduct(product);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartDetails()
                        ));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple.shade800)),
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
