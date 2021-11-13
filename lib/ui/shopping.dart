import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              final value = items[index];
              context.goNamed(detailsRouteName, params: {'item': value});
            },
          );
        },
      ),
    );
  }
}
