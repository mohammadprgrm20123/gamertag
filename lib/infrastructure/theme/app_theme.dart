import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData getAppTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColor.primeryColor,
        inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderSide:  BorderSide(width: 2,color: AppColor.appBarBackground),
                borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2,color: AppColor.appBarBackground),
                borderRadius: BorderRadius.circular(16)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 2,color: AppColor.appBarBackground),
                borderRadius: BorderRadius.circular(16))),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 57,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontSize: 45,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          titleMedium: TextStyle(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400),
          titleSmall: TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            letterSpacing: 0.1,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            letterSpacing: 0.5,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          labelSmall: TextStyle(
            fontSize: 11,
            letterSpacing: 0.5,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            letterSpacing: 0.15,
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
          bodyMedium: TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 11,
            letterSpacing: 0.4,
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColor.primeryColor),
          backgroundColor: AppColor.appBarBackground.withOpacity(.7),
        ),
        useMaterial3: true,
      );
}
