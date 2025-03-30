import 'package:cineverse/core/api/dio_client.dart';
import 'package:cineverse/core/routes/app_router.dart';
import 'package:cineverse/core/routes/app_routes.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize dependencies
  await setUpDependencyInjection();

  // Set up Dio client
  getIt<DioClient>().setDio();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MaterialApp(
        title: 'Cine Verse',
        theme: AppTheme.theme,
        initialRoute: AppRoutes.movieDetails,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
