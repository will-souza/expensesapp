import 'package:expensesapp/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<Transaction> transactions = [
    Transaction(
      id: 1,
      title: 'New Shoes',
      amount: 60.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'McDonald\'s',
      amount: 15.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Personal Expenses'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.black26,
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Batata'),
              ),
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black12),
                        ),
                      ),
                      child: Text(
                        '\$${transaction.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat().add_yMd().add_Hm().format(
                                  transaction.date,
                                ),
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
