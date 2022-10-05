
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Center(
                child: Text('first page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
