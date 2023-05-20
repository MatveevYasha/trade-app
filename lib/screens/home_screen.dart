// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:trade_app/screens/currency_pair_screen.dart';

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
  int userBalance = 10000;
  String str = '';
  int investment = 100;
  int minutes = 0;
  int seconds = 1;

  @override
  void initState() {
    super.initState();
    _increase();
    _loadUrl(widget.url);
  }

  _loadUrl(String url) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
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
    String bal = '$userBalance';
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
          str = '$userBalance';
      }
    } else {
      str = '$userBalance';
    }
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
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E303E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          str,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: WebViewWidget(controller: controller),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CurrencyPairScreen()),
                      );
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
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
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        margin: const EdgeInsets.only(left: 30),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E303E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Timer'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (seconds > 1 || minutes > 0) {
                                        if (seconds != 0) {
                                          seconds = seconds - 1;
                                        }
                                        if (seconds == 0) {
                                          minutes = minutes - 1;
                                          seconds = 59;
                                        }
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xFFC8C8C8),
                                  ),
                                ),
                                Text(
                                  '${(minutes.toString().padLeft(2, '0'))}:${(seconds.toString().padLeft(2, '0'))}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      seconds = seconds + 1;
                                      if (seconds == 60) {
                                        minutes = minutes + 1;
                                        seconds = 0;
                                      }
                                    });
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
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        margin: const EdgeInsets.only(right: 30),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2E303E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Investment'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (investment > 100) {
                                        investment = investment - 100;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xFFC8C8C8),
                                  ),
                                ),
                                Text(
                                  '$investment',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (investment <= userBalance) {
                                        investment = investment + 100;
                                      }
                                    });
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
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          int chance = Random().nextInt(2);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: const Color(0xFF1D202E),
                              duration: const Duration(milliseconds: 750),
                              content: (chance == 0)
                                  ? const Text('unsuccessFully')
                                  : const Text('successFully'),
                            ),
                          );
                          setState(() {
                            if (chance == 1) {
                              userBalance = userBalance +
                                  investment +
                                  (investment * 0.7).toInt();
                            }
                            if (chance == 0) {
                              userBalance = userBalance - investment;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          margin: const EdgeInsets.only(left: 30),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.redAccent[400],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Sell',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          int chance = Random().nextInt(2);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: const Color(0xFF1D202E),
                              duration: const Duration(milliseconds: 750),
                              content: (chance == 0)
                                  ? const Text('unsuccessFully')
                                  : const Text('successFully'),
                            ),
                          );
                          setState(() {
                            if (chance == 1) {
                              userBalance = userBalance +
                                  investment +
                                  (investment * 0.7).toInt();
                            }
                            if (chance == 0) {
                              userBalance = userBalance - investment;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          margin: const EdgeInsets.only(right: 30),
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[400],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Buy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'TOP 10 Traders',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: const BoxDecoration(
                        color: Color(0xFF2E303E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('№'),
                        Text('Country'),
                        Text('Name'),
                        Text('Deposit'),
                        Text('Profit'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          decoration: BoxDecoration(
                            color: (index % 2 != 0)
                                ? const Color(0xFF2E303E)
                                : const Color(0xFF1D202E),
                            borderRadius: (index == 9)
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  )
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('${index + 1}'),
                              Flag.fromCode(
                                contries[index],
                                height: 25,
                                width: 25,
                              ),
                              Text(
                                name[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '\$${deposit[index]}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '\$${profit[index]}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
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
