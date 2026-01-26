import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TaskProvider())],
      child: MaterialApp(
        title: 'Taski',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // darkTheme: ThemeData(),
        home: const SplashScreen(),
      ),
    );
  }
}
