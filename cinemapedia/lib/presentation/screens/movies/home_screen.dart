import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final StatefulNavigationShell currentChild;

  const HomeScreen({
    super.key,
    required this.currentChild,
  });

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.pathSegments;
    return Scaffold(
      body: currentChild,
      bottomNavigationBar:
          location.isNotEmpty && location[0].startsWith('movie')
              ? null
              : CustomBottomNavBar(currentChild: currentChild),
    );
  }
}
