import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {super.key});
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                transactions[index].amount.toStringAsFixed(2),
                style: const TextStyle(fontSize: 10),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                  .format(transactions[index].date),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            trailing: const Icon(Icons.delete),
            iconColor: Colors.grey,
            dense: true,
            onTap: () {},
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
