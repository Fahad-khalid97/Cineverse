import 'package:cineverse/core/api/dio_client.dart';
import 'package:cineverse/core/store/secure_storage_service.dart';
import 'package:cineverse/core/routes/app_router.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/features/account/profile_setting/bloc/profile/profile_cubit.dart';
import 'package:cineverse/features/movie/my_list/bloc/my_list/my_list_cubit.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:cineverse/widget/smart_widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cineverse/features/movie/home/bloc/home/home_cubit.dart';
import 'package:cineverse/features/auth/login/bloc/login_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cineverse/l10n/app_localizations.dart';
import 'package:cineverse/features/auth/login/view/login_screen.dart';
import 'package:cineverse/features/account/profile_setting/bloc/profile/profile_state.dart';

import 'package:cineverse/features/movie/media_details/bloc/media_detail/media_detail_cubit.dart';
import 'package:cineverse/objectbox.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize dependencies
  final store = await openStore();
  await setUpDependencyInjection(store);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()),
        BlocProvider(create: (context) => getIt<LoginCubit>()),
        BlocProvider(create: (context) => getIt<MyListCubit>()),
        BlocProvider(create: (context) => getIt<MediaDetailCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final appSetting = state.appSetting;
              final theme = appSetting.theme;
              final language = appSetting.language;
              return MaterialApp(
                title: 'Cineverse',
                debugShowCheckedModeBanner: false,
                locale: Locale(language),
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'), // English
                  Locale('ar'), // Arabic
                  Locale('fr'), // French
                  Locale('es'), // Spanish
                ],
                themeMode:
                    theme == 'light'
                        ? ThemeMode.light
                        : theme == 'dark'
                        ? ThemeMode.dark
                        : ThemeMode.system,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                home: const SplashScreen(),
                onGenerateRoute: AppRouter.onGenerateRoute,
              );
            },
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
      nextScreen: const SplashRedirect(),
    );
  }
}

class SplashRedirect extends StatelessWidget {
  const SplashRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SecureStorageService().getSessionId(),
      builder: (context, snapshot) {
        return snapshot.data != null
            ? const BottomNavBar()
            : const LoginScreen();
      },
    );
  }
}
