import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/ranking/ui/ranking_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const RankingPage(),
    ),
  ],
);
