import 'package:absurd_launcher/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffffff).withOpacity(0),
        backgroundColor: const Color(0xffffffff).withOpacity(0),
      ),
      home: const HomeScreen(),
    );
  }
}
