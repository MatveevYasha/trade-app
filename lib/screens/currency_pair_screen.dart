import 'package:flutter/material.dart';
import 'package:trade_app/models/pair.dart';
import 'package:trade_app/screens/home_screen.dart';

class CurrencyPairScreen extends StatefulWidget {
  const CurrencyPairScreen({super.key});

  @override
  State<CurrencyPairScreen> createState() => _CurrencyPairScreenState();
}

class _CurrencyPairScreenState extends State<CurrencyPairScreen> {
  int selectedIndex = 0;
  String selectedPair = 'EUR/USD';
  String selectedUrl =
      'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD';

  List<Pair> list = [
    Pair(
        pair: 'EUR/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD'),
    Pair(
        pair: 'GPB/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD'),
    Pair(
        pair: 'EUR/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD'),
    Pair(
        pair: 'GPB/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD'),
    Pair(
        pair: 'EUR/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD'),
    Pair(
        pair: 'GPB/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD'),
    Pair(
        pair: 'EUR/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD'),
    Pair(
        pair: 'GPB/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD'),
    Pair(
        pair: 'EUR/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD'),
    Pair(
        pair: 'GPB/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD'),
    Pair(
        pair: 'EUR/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD'),
    Pair(
        pair: 'GPB/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD'),
    Pair(
        pair: 'EUR/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AEURUSD'),
    Pair(
        pair: 'GPB/USD',
        url:
            'https://www.tradingview.com/chart/Cvmu3eoX/?symbol=FX_IDC%3AGBPUSD'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D202E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => HomeScreen(
                                  url: selectedUrl, pair: selectedPair),
                              transitionDuration:
                                  const Duration(milliseconds: 250),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(-1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                final tween = Tween(begin: begin, end: end);
                                final curvedAnimation = CurvedAnimation(
                                  parent: animation,
                                  curve: curve,
                                );

                                return SlideTransition(
                                  position: tween.animate(curvedAnimation),
                                  child: child,
                                );
                              }),
                        );
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    const Spacer(flex: 2),
                    const Text(
                      'Currency pair',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 5),
                      ),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              selectedPair = list[index].pair;
                              selectedUrl = list[index].url;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: (selectedIndex == index)
                                  ? Colors.greenAccent[400]
                                  : const Color(0xFF2E303E),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                list[index].pair,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
