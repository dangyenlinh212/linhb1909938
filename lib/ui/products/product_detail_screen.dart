import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('\$${product.price}'),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              product.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ],
      )),
    );
  }
}
