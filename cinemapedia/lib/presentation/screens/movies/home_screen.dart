import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: moviesSlideshow),
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 21',
                    loadNextPage: () {
                      ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .loadNextPage();
                    },
                  ),
                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Proximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () {
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    },
                  ),
                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Top',
                    subTitle: 'Las mejores',
                    loadNextPage: () {
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                    },
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
