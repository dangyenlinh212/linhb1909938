import 'package:flutter/material.dart';

import 'products_grid.dart';

enum FilterOptions { favorite, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          child: Text('Only Favorite'),
          value: FilterOptions.favorite,
        ),
        const PopupMenuItem(
          child: Text('Show all'),
          value: FilterOptions.all,
        )
      ],
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorite)
            _showOnlyFavorites = true;
          if (selectedValue == FilterOptions.all) _showOnlyFavorites = false;
        });
      },
      icon: const Icon(Icons.more_vert),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
        onPressed: () {
          print('go to cart screen');
        },
        icon: const Icon(Icons.shopping_cart));
  }
}
