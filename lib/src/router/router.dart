import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/rank_listing/ui/pages/home.dart';
import '../features/ranking/ui/pages/ranking_page.dart';
import 'route_names.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: RouteNames.home,
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Home(),
      routes: <RouteBase>[
        GoRoute(
          name: RouteNames.ranking,
          path: 'ranking',
          builder: (BuildContext context, GoRouterState state) =>
              RankingPage(id: state.uri.queryParameters['id']),
        ),
      ],
    ),
  ],
);
