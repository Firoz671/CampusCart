import 'package:campus_cart/ui/screens/splash_screen.dart';
import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CampusCart extends StatelessWidget {
  const CampusCart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeLarge = screenWidth * 0.06;
    double fontSizeMedium = screenWidth * 0.05;
    double fontSizeSmall = screenWidth * 0.02;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.whiteColor,
          ),
          scaffoldBackgroundColor: AppColors.whiteColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maximumSize: Size(size.width * 0.3, size.height * 0.05),
                minimumSize: Size(size.width * 0.3, size.height * 0.05),
                fixedSize: Size(size.width * 0.3, size.height * 0.05),
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor),
          ),
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontSize: fontSizeLarge, fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(fontSize: fontSizeMedium),
              bodySmall: TextStyle(fontSize: fontSizeSmall))),
      home: SplashScreen(),
    );
  }
}
