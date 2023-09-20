import 'package:bookly_app/core/uitls/server_locator.dart';
import 'package:bookly_app/features/home/date/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/date/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentaion/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentaion/views/home_view.dart';
import 'package:bookly_app/features/home/presentaion/views_model/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/features/search/presentaion/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentaion/view_models/views/splash_view.dart';

abstract class AppRoutes {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';
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
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
