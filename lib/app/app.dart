import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../utils/app_colors.dart';

class ThermIQApp extends StatelessWidget {
  const ThermIQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThermIQ',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',

        scaffoldBackgroundColor: const Color(0xff070707),

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.orange,
          brightness: Brightness.dark,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        cardTheme: CardThemeData(
          color: const Color(0xff161616),
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),

        dividerColor: Colors.white10,

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),

      builder: (context, child) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topRight,
              radius: 1.6,
              colors: [
                Color(0xff1A120A),
                Color(0xff0B0B0B),
                Color(0xff050505),
              ],
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },

      home: const HomeScreen(),
    );
  }
}