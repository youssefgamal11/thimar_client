import 'package:flutter/material.dart';
import 'package:thimar_app/screens/home/pages/my_orders/components/order_item.dart';

class FinishedItems extends StatelessWidget {
  const FinishedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const ItemOrder();
          }),
    );
  }
}
