import 'package:flutter/material.dart';
import 'widget/expenses.dart';

var kColorScheme= ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 96, 59, 181),
);
var kDarkScheme=ColorScheme.fromSeed(
  brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 5, 99, 125)
);

void main(){
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: kDarkScheme,
            cardTheme: CardTheme().copyWith(
              color: kDarkScheme.secondaryContainer,
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkScheme.primaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: kDarkScheme.onSecondaryContainer,
              ),
            ),
          ),
          theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
            ),
            cardTheme: CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: kColorScheme.onSecondaryContainer,
              ),
            ),
          ),
          home: Expenses(),
    ),
  );
}
