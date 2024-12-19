import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../router/route_names.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () =>
              context.go(context.namedLocation(RouteNames.ranking)),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
