import 'package:expensesapp/models/transaction.dart';
import 'package:expensesapp/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// no need for a stateful widget
// ignore: must_be_immutable
class Chart extends StatelessWidget {
  Chart(this.recentTransactions, {super.key});
  List<Transaction> recentTransactions = [];

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        DateTime date = recentTransactions[i].date;
        if (date.day == weekDay.day &&
            date.month == weekDay.month &&
            date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransactionValues.map((data) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: data['day'] as String,
                      spendingAmount: data['amount'] as double,
                      spendingPercentTotal: totalSpending == 0
                          ? 0
                          : (data['amount'] as double) / totalSpending,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
