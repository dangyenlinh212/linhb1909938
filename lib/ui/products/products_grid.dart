import 'package:flutter/cupertino.dart';
import 'product_grid_tile.dart';
import 'products_manager.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductsGrid(this.showFavorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductManager();
    final products =
        showFavorites ? productsManager.favoriteItems : productsManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, i) => ProductGridTile(products[i]),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
