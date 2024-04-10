import 'package:flutter/material.dart';
import 'package:shopping_app/models/my_product.dart';
import 'package:shopping_app/screens/Details.dart';

import '../widgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Products",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCategory(index: 0, name: "All Products"),
                  _buildProductCategory(index: 1, name: "Jackets"),
                  _buildProductCategory(index: 2, name: "Sneakers"),
                ],
              ),
            ),
            Expanded(
                child: isSelected == 0
                    ? _buildAllProducts()
                    : isSelected == 1
                        ? _buildJackets()
                        : _buildSneakers())
          ],
        ),
      ),
    );
  }

  _buildProductCategory({required int index, required String name}) =>
      // GestureDetector(
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index
                  ? Colors.purpleAccent
                  : Colors.purple.shade100,
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  // );
  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 142),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allProducts.length,
        itemBuilder: (context, index) {
          final productItem = MyProducts.allProducts[index];
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(product: productItem))),
              child: ProductCard(product: productItem));
        },
      );

  _buildJackets() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 142),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.jacketsList.length,
        itemBuilder: (context, index) {
          final productItem = MyProducts.jacketsList[index];
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(product: productItem))),
              child: ProductCard(product: productItem));
        },
      );

  _buildSneakers() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 142),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.sneakersList.length,
        itemBuilder: (context, index) {
          final productItem = MyProducts.sneakersList[index];
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(product: productItem))),
              child: ProductCard(product: productItem));
        },
      );
}
