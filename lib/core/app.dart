import 'package:day_02_bmi_calculator/core/theme/dark_theme.dart';
import 'package:day_02_bmi_calculator/core/theme/light_theme.dart';
import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:day_02_bmi_calculator/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      child: Consumer<BmiProvider>(
        builder: (context, bmmiProvider, child) {
          return MaterialApp(
            title: 'BMI Calculator',
            debugShowCheckedModeBanner: false,
            theme: LightTheme.lightTheme(),
            darkTheme: DarkTheme.darkTheme(),
            themeMode:
                bmmiProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const BmiCalculatorScreen(),
          );
        },
      ),
    );
  }
}
