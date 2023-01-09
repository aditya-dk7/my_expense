import 'package:flutter/material.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: const [
          Icon(
            Icons.apple,
            size: 36,
          ),
          SizedBox(
            height: 20,
            width: 10,
          ),
          Text(
            "Fruits",
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(
            height: 20,
            width: 140,
          ),
          Text(
            '₹5,400.90',
            style: TextStyle(fontSize: 28),
          )
        ],
      ),
    );
  }
}
