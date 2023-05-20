import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1D202E),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.white.withOpacity(0)),
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.red),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.white.withOpacity(0)),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
                child: Container(color: Colors.white.withOpacity(0)),
              )
            ],
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
