import 'package:flutter/material.dart';

import '../../models/product.dart';

class UserProductsListTile extends StatelessWidget {
  final Product product;

  const UserProductsListTile(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      trailing: SizedBox(
        width: 100,
        child: Row(children: <Widget>[
          buildEditButton(context),
          buildDeleteButton(context)
        ]),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        print('Delete a product');
      },
      icon: const Icon(Icons.delete),
      color: Theme.of(context).errorColor,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      onPressed: (() {
        print('Go to edit product screen');
      }),
      icon: const Icon(Icons.edit),
      color: Theme.of(context).primaryColor,
    );
  }
}
