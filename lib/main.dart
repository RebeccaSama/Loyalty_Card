import 'package:flutter/material.dart';
import 'package:loyalty_card/features/splashscreen/splashscreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white, elevation: 0),
        useMaterial3: true,
      ),
      home: const SplashscreenPage(),
    );
  }
}
