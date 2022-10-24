import 'package:flutter/material.dart';

import 'order_item.dart';

class CurrentItems extends StatelessWidget {
  const CurrentItems({Key? key}) : super(key: key);

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
