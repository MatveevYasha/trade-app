import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_app/domain/cost_notifier.dart';
import 'package:trade_app/screens/home_screen/home_screen.dart';

// ignore: must_be_immutable
class ColorButton extends StatelessWidget {
  bool hideText;
  final Color? color;
  final String text;
  final EdgeInsets margin;

  ColorButton({
    Key? key,
    required this.hideText,
    required this.color,
    required this.text,
    required this.margin,
    required this.balanceFieldController,
  }) : super(key: key);

  final TextEditingController balanceFieldController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          hideText = false;
          int chance = Random().nextInt(2);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xFF1D202E),
              duration: const Duration(milliseconds: 750),
              content: (chance == 0)
                  ? const Text('Unsuccessfully')
                  : const Text('Successfully'),
            ),
          );
          int ub = int.parse(balanceFieldController.text);
          context.read<CostNotifier>().trade(ub, chance);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xFF1D202E),
              duration: Duration(milliseconds: 750),
              content: Text('Error'),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 20),
        margin: margin,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
