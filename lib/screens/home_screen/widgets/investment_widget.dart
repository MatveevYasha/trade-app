import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_app/domain/cost_notifier.dart';
import 'package:trade_app/screens/home_screen/home_screen.dart';

// ignore: must_be_immutable
class InvestmentWidget extends StatefulWidget {
  InvestmentWidget({
    super.key,
    required this.hideText,
    required this.balanceFieldController,
  });

  bool hideText;
  final TextEditingController balanceFieldController;

  @override
  State<InvestmentWidget> createState() => _InvestmentWidgetState();
}

class _InvestmentWidgetState extends State<InvestmentWidget> {
  bool balanceFieldControllerIsActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.only(right: 30),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: const Color(0xFF2E303E),
          borderRadius: BorderRadius.circular(12),
          border: (balanceFieldControllerIsActive)
              ? Border.all(color: Colors.greenAccent)
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.hideText) ? const Text('') : const Text('Investment'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.balanceFieldController.text.isNotEmpty &&
                      widget.balanceFieldController.text
                          .contains(RegExp(r'\d'))) {
                    int inv = int.parse(widget.balanceFieldController.text);
                    setState(() {
                      if (inv > 100) {
                        inv = inv - 100;
                        widget.balanceFieldController.text = '$inv';
                      }
                    });
                  }
                },
                child: const Icon(
                  Icons.remove_circle_outline,
                  color: Color(0xFFC8C8C8),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onTap: () {
                      setState(() {
                        balanceFieldControllerIsActive = true;
                      });
                    },
                    onTapOutside: (event) {
                      setState(() {
                        balanceFieldControllerIsActive = false;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          widget.hideText = true;
                        });

                        return 'Empty count';
                      }
                      if (value.contains(RegExp(r'\D'))) {
                        setState(() {
                          widget.hideText = true;
                        });
                        return 'Enter number';
                      }
                      if ((int.parse(value) >
                              Provider.of<CostNotifier>(context, listen: false)
                                  .userBalance) ==
                          true) {
                        setState(() {
                          widget.hideText = true;
                        });

                        return 'Overrun';
                      }
                      if ((int.tryParse(value)! % 100 != 0) == true) {
                        setState(() {
                          widget.hideText = true;
                        });

                        return 'Multiple 100';
                      }

                      return null;
                    },
                    controller: widget.balanceFieldController,
                    keyboardType: TextInputType.number,
                    enabled: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.balanceFieldController.text.isNotEmpty &&
                      widget.balanceFieldController.text
                          .contains(RegExp(r'\d'))) {
                    int inv = int.parse(widget.balanceFieldController.text);
                    setState(() {
                      if (inv <=
                          Provider.of<CostNotifier>(context, listen: false)
                              .userBalance) {
                        inv = inv + 100;
                        widget.balanceFieldController.text = '$inv';
                      }
                    });
                  }
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Color(0xFFC8C8C8),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
