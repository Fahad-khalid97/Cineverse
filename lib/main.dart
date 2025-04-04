import 'package:cineverse/core/api/dio_client.dart';
import 'package:cineverse/core/routes/app_router.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cineverse/features/movie/home/view/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/features/movie/home/bloc/home/home_cubit.dart';
import 'package:cineverse/features/auth/login/bloc/login_cubit.dart';
// Add your login cubit import here
// import 'package:cineverse/features/auth/login/bloc/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize dependencies
  await setUpDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => getIt<LoginCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            title: 'Cineverse',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: const SplashScreen(),
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1000,
      splash: Image.asset(AppImage.logo, fit: BoxFit.cover),
      splashIconSize: 200,
      backgroundColor: Theme.of(context).primaryColor,
      nextScreen: const HomeScreen(),
    );
  }
}
