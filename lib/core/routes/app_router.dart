import 'package:cineverse/core/routes/app_routes.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/features/account/profile_setting/view/profile_screen.dart';
import 'package:cineverse/features/auth/login/view/login_screen.dart';
import 'package:cineverse/features/movie/home/bloc/home/home_cubit.dart';
import 'package:cineverse/features/movie/home/view/home.dart';
import 'package:cineverse/features/movie/my_list/view/my_list.dart';
import 'package:cineverse/features/movie/movie_details/view/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.home:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => getIt<HomeCubit>(),
                child: const HomeScreen(),
              ),
        );
      case AppRoutes.myList:
        return MaterialPageRoute(builder: (_) => const MyListScreen());

      case AppRoutes.movieDetails:
        // final args = settings.arguments as Map<String, dynamic>;
        // final movieId = args['movieId'] as int;
        return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(movieId: 500),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
