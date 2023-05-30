import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

class TopTradersScreen extends StatelessWidget {
  const TopTradersScreen({
    super.key,
    required this.contries,
    required this.name,
    required this.deposit,
    required this.profit,
  });

  final List<FlagsCode> contries;
  final List<String> name;
  final List<int> deposit;
  final List<int> profit;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              itemCount: name.length,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  decoration: BoxDecoration(
                    color: (index % 2 != 0)
                        ? const Color(0xFF2E303E)
                        : const Color(0xFF1D202E),
                    borderRadius: (index == name.length - 1)
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
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$${deposit[index]}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
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
    );
  }
}
