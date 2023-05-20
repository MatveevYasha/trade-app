import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_app/global_widgets/background_widget.dart';
import 'package:trade_app/screens/home_screen.dart';

class ActivateScreen extends StatefulWidget {
  const ActivateScreen({super.key});

  @override
  State<ActivateScreen> createState() => _ActivateScreenState();
}

class _ActivateScreenState extends State<ActivateScreen> {
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: const Text('“App” would like to Send You Notifications'),
          content: const Text(
              'Notifications may include alerts, sounds and icon badges. These can be configured in Settings.'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDestructiveAction: false,
              textStyle: TextStyle(color: Colors.blue[600]),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Don\'t Allow'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              textStyle: TextStyle(color: Colors.blue[600]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      pair: 'GPB/USD',
                      url:
                          'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD',
                    ),
                  ),
                );
              },
              child: const Text('Allow'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const BackgroundWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => _showAlertDialog(context),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    'Activate NOW',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
