import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.label,
    required this.spendingAmount,
    required this.spendingPercentTotal,
  });

  final String label;
  final double spendingAmount;
  final double spendingPercentTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(2)}'),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                    width: 1,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
