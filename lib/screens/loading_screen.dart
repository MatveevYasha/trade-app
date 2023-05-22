import 'package:flutter/material.dart';
import 'package:trade_app/global_widgets/background_widget.dart';
import 'package:trade_app/screens/activate_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int loadingPercent = 0;

  @override
  void initState() {
    loading();
    super.initState();
  }

  void pushToNextScreen() async {
    // ignore: use_build_context_synchronously
    if (loadingPercent == 100) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ActivateScreen()),
      );
    }
  }

  void loading() async {
    await Future.delayed(const Duration(milliseconds: 500));
    while (loadingPercent != 100) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() {
        loadingPercent++;
      });
    }
    pushToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Stack(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        (0.7 * (loadingPercent / 100)),
                    height: (loadingPercent < 5)
                        ? MediaQuery.of(context).size.height *
                            0.03 *
                            (0.7 * (loadingPercent / 20))
                        : MediaQuery.of(context).size.height * 0.03,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '$loadingPercent %',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
