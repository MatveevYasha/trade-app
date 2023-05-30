import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_app/domain/cost_notifier.dart';
import 'package:trade_app/trade_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CostNotifier()),
      ],
      child: const TradeApp(),
    ),
  );
}
