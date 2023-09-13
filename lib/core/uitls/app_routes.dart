import 'package:bookly_app/features/home/presentaion/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentaion/view_models/views/splash_view.dart';

abstract class AppRoutes {
  static const kHomeView = '/HomeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
