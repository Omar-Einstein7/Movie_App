import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/theme/theme_cubit.dart';
import 'package:movie_app/core/config/theme/app_theme.dart';
import 'package:movie_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:movie_app/presentation/splash/pages/splash.dart';
import 'package:movie_app/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appstarted()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
