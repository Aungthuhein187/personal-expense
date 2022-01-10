import 'dart:ui';

import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import 'widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expense",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber),
        fontFamily: "Quicksands",
        appBarTheme: AppBarTheme(
            toolbarTextStyle: TextTheme().bodyText2,
            titleTextStyle: TextTheme().headline6),
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.purple,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.purple,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontFamily: "Opensans",
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _title = "Personal Expense";
  final List<Transaction> _transactions = [
    Transaction(
        id: DateTime.now().toString(),
        title: 'New Shoe',
        price: 102.99,
        date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(
        id: DateTime.now().toString(),
        title: 'Lunch',
        price: 12.99,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: DateTime.now().toString(),
        title: 'Old Car',
        price: 599.99,
        date: DateTime.now().subtract(Duration(days: 8))),
  ];

  void submitTransaction(String title, double price) {
    setState(() {
      _transactions.add(Transaction(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          date: DateTime.now()));
    });

    Navigator.of(context).pop();
  }

  void _showModalTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return NewTransaction(
            submitTransaction: submitTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
              onPressed: () => _showModalTransaction(context),
              icon: const Icon(Icons.add)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showModalTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                'Chart',
              ),
              color: Colors.blue,
              elevation: 5,
              margin: EdgeInsets.all(5),
            ),
          ),
          TransactionList(
            transactions: _transactions,
          ),
        ],
      ),
    );
  }
}
