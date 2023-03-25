import 'package:flutter/material.dart';

class EnteringBackgroundPage extends StatelessWidget {
  const EnteringBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber.shade100, shape: BoxShape.circle),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber.shade100, shape: BoxShape.circle),
              ),
            ),
          )
        ],
      ),
    );
  }
}
