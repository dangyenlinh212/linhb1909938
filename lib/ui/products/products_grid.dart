// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_grid_tile.dart';
import 'products_manager.dart';
import '../../models/product.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorite;
  const ProductsGrid(this.showFavorite, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => showFavorite
            ? productsManager.favoriteItems
            : productsManager.items);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductGridTile(products[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
