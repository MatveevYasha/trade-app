// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_app/screens/home_screen/widgets/balance_widget.dart';
import 'package:trade_app/screens/home_screen/widgets/color_button.dart';
import 'package:trade_app/screens/home_screen/widgets/investment_widget.dart';
import 'package:trade_app/screens/home_screen/widgets/select_pair.dart';
import 'package:trade_app/screens/home_screen/widgets/timer_widget.dart';
import 'package:trade_app/screens/home_screen/widgets/top_traders_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:trade_app/domain/cost_notifier.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String url;
  String pair;
  HomeScreen({
    Key? key,
    required this.url,
    required this.pair,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController controller;
  int currenIndex = 0;
  String str = '';
  int investment = 100;
  final balanceFieldController = TextEditingController();
  bool hideText = false;

  @override
  void initState() {
    super.initState();
    _increase();
    _loadUrl(widget.url);
    _setValue();
  }

  _loadUrl(String url) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  _increase() async {
    while (true) {
      int rndIndex = Random().nextInt(9);
      int rndValue = (50 + Random().nextInt(150 - 50));
      await Future.delayed(const Duration(minutes: 3));
      setState(() {
        deposit[rndIndex] = deposit[rndIndex] + rndValue;
        profit[rndIndex] = profit[rndIndex] + rndValue;
      });
    }
  }

  _convertBalance() {
    String bal = '${context.watch<CostNotifier>().userBalance}';
    List<String> listBal = bal.split('');
    if (listBal.length > 3) {
      switch (listBal.length) {
        case 4:
          listBal.insert(1, ' ');
          bal = listBal.join();
          str = bal;
          break;
        case 5:
          listBal.insert(2, ' ');
          bal = listBal.join();
          str = bal;
          break;
        case 6:
          listBal.insert(3, ' ');
          bal = listBal.join();
          str = bal;
          break;
        default:
          str = '${context.watch<CostNotifier>().userBalance}';
      }
    } else {
      str = '${context.watch<CostNotifier>().userBalance}';
    }
  }

  void _setValue() {
    balanceFieldController.text = '100';
  }

  final List<String> name = [
    'Oliver',
    'Jack',
    'Harry',
    'Jacob',
    'Charley',
    'Thomas',
    'George',
    'Oscar',
    'James',
    'William',
  ];
  List<int> deposit = [
    3333,
    2222,
    1111,
    999,
    888,
    777,
    666,
    555,
    444,
    333,
  ];
  List<int> profit = [
    60000,
    54000,
    48000,
    42000,
    36000,
    30000,
    24000,
    18000,
    12000,
    6000,
  ];
  final List<FlagsCode> contries = [
    FlagsCode.US,
    FlagsCode.CA,
    FlagsCode.BR,
    FlagsCode.KR,
    FlagsCode.DE,
    FlagsCode.BR,
    FlagsCode.FR,
    FlagsCode.AU,
    FlagsCode.IN,
    FlagsCode.ES,
  ];

  @override
  Widget build(BuildContext context) {
    _convertBalance();
    return Scaffold(
        backgroundColor: const Color(0xFF1D202E),
        body: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Trade',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  BalanceWidget(str: str),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: WebViewWidget(controller: controller),
                  ),
                  SelectPair(widget: widget),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Row(
                    children: [
                      const TimerWidget(),
                      const Spacer(),
                      InvestmentWidget(
                          hideText: hideText,
                          balanceFieldController: balanceFieldController),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Row(
                    children: [
                      ColorButton(
                        balanceFieldController: balanceFieldController,
                        hideText: hideText,
                        color: Colors.redAccent[400],
                        text: 'Sell',
                        margin: const EdgeInsets.only(left: 30),
                      ),
                      const Spacer(),
                      ColorButton(
                        balanceFieldController: balanceFieldController,
                        hideText: hideText,
                        color: Colors.greenAccent[400],
                        text: 'Buy',
                        margin: const EdgeInsets.only(right: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: TopTradersScreen(
                contries: contries,
                name: name,
                deposit: deposit,
                profit: profit),
          )
        ][currenIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF1D202E),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                label: 'Trade',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2),
                label: 'Top',
              ),
            ],
            currentIndex: currenIndex,
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              setState(() {
                currenIndex = index;
              });
            },
          ),
        ));
  }
}
