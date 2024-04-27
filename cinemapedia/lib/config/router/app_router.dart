import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeScreen(currentChild: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/',
                builder: (context, state) => const HomeView(),
                routes: [
                  GoRoute(
                    path: 'movie/:id',
                    builder: (context, state) => MovieScreen(
                      movieId: state.pathParameters['id'] ?? 'no-id',
                    ),
                  ),
                ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/categories',
              builder: (context, state) {
                return const CategoriesView();
              },
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) {
                return const FavoritesView();
              },
            ),
          ]),
        ]),
  ],
);
