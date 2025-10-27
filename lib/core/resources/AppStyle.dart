import 'package:evently_c16/core/resources/ColorsManager.dart';
import 'package:flutter/material.dart';

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primaryColor,
      shape: StadiumBorder(
          side: BorderSide(
              color: Colors.white,
              width: 5
          )
      )
    ),
    scaffoldBackgroundColor: ColorsManager.lightBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primaryColor,
        type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: ColorsManager.primaryColor
      ),
      iconTheme: IconThemeData(
          color: ColorsManager.primaryColor
      )
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorsManager.blackColor
      ),
        titleMedium: TextStyle(
        color: Color(0xff7B7B7B),
        fontSize: 16,
        fontWeight: FontWeight.w500
    ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: ColorsManager.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: ColorsManager.primaryColor
      )
    ),
     colorScheme: ColorScheme.light(
       primary: ColorsManager.primaryColor,
       background: ColorsManager.lightBackgroundColor,
       secondary: ColorsManager.blackColor,
       tertiary: Color(0xff7B7B7B)
     )
  );
  static ThemeData darkTheme = ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsManager.darkBackgroundColor,
          shape: StadiumBorder(
            side: BorderSide(
              color: Colors.white,
              width: 5
            )
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.darkBackgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white
      ),
    scaffoldBackgroundColor: ColorsManager.darkBackgroundColor,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: ColorsManager.primaryColor
        ),
        iconTheme: IconThemeData(
          color: ColorsManager.primaryColor
        )
    ),
    colorScheme: ColorScheme.dark(
        primary: ColorsManager.primaryColor,
        background: ColorsManager.darkBackgroundColor,
        secondary: ColorsManager.darkTextColor,
        tertiary: Color(0xffF4EBDC)

  ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorsManager.darkTextColor
      ),
      titleMedium: TextStyle(
        color: Color(0xffF4EBDC),
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
        titleSmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: ColorsManager.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.primaryColor
        )
    )
  );
}