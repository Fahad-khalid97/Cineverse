import 'package:cineverse/core/routes/app_routes.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/features/account/profile_setting/view/profile_screen.dart';
import 'package:cineverse/features/auth/login/view/login_screen.dart';
import 'package:cineverse/features/movie/home/bloc/home/home_cubit.dart';
import 'package:cineverse/features/movie/home/view/home.dart';
import 'package:cineverse/features/movie/my_list/view/my_list.dart';
import 'package:cineverse/features/movie/media_details/view/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:cineverse/data/models/media/movie_model.dart';
import 'package:cineverse/widget/smart_widget/bottom_nav_bar/bottom_nav_bar.dart';

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
        final args = settings.arguments as Map<String, dynamic>;
        final movie = args['movie'] as MovieModel;
        final type = args['type'] as String;
        return MaterialPageRoute(
          builder: (_) => MediaDetailScreen(movie: movie, type: type),
        );
      case AppRoutes.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());

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
