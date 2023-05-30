import 'package:flutter/material.dart';
import 'package:trade_app/screens/currency_pair_screen.dart';
import 'package:trade_app/screens/home_screen/home_screen.dart';

class SelectPair extends StatelessWidget {
  const SelectPair({
    super.key,
    required this.widget,
  });

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CurrencyPairScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF2E303E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Spacer(flex: 3),
            Text(
              widget.pair,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Spacer(flex: 2),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 36,
            )
          ],
        ),
      ),
    );
  }
}
