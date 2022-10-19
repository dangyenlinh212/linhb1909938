import 'package:flutter/material.dart';

import '../shared/app_drawer.dart';
import 'products_manager.dart';
import 'user_product_list_tile.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh Product'),
        child: buildUserProductListView(productsManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productManager) {
    return ListView.builder(
        itemCount: productManager.itemCount,
        itemBuilder: (ctx, i) => Column(
              children: [
                UserProductListTile(productManager.items[i]),
                const Divider()
              ],
            ));
  }

  Widget buildAddButton() {
    return IconButton(
        onPressed: () {
          print('Go to edit product screen');
        },
        icon: const Icon(Icons.add));
  }
}
