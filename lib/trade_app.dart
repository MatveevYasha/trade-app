import 'package:flutter/material.dart';
import 'package:trade_app/screens/home_screen.dart';
import 'package:trade_app/screens/loading_screen.dart';

class TradeApp extends StatelessWidget {
  const TradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}
