import 'package:flutter/material.dart';
import 'package:fsphere/core/res/colors.dart';
import 'package:fsphere/core/res/fonts.dart';
import 'package:fsphere/core/services/injection_container.dart';
import 'package:fsphere/core/services/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'f/sphere',
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: Fonts.roboto,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
