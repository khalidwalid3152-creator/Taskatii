import 'package:flutter/material.dart';
import 'package:taskatti/core/constants/Appfonts.dart';
import 'package:taskatti/core/features/splash/splash_screen.dart';
import 'package:taskatti/core/utils/colors.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolors.primaryColor)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolors.primaryColor)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolors.pinkColor)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolors.primaryColor)
          ),
        ),
        
        scaffoldBackgroundColor: Appcolors.whiteColor,
        fontFamily:Appfonts.popenfont,
        appBarTheme:AppBarTheme(surfaceTintColor: Colors.transparent,backgroundColor: Appcolors.whiteColor,centerTitle: true)
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
