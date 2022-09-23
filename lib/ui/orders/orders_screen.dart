import 'package:flutter/material.dart';

import '../shared/app_drawer.dart';
import 'order_manager.dart';
import 'order_item_card.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("building orders");
    final ordersManager = OrdersManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItemCard(ordersManager.orders[i]),
        itemCount: ordersManager.orderCount,
      ),
    );
  }
}
