import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({Key? key, required this.transactions}) : super(key: key);

  void addNewTransaction(String title, double price) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        date: DateTime.now());

    transactions.add(newTransaction);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text("There is no transaction."),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '\$ ${transactions[index].price.toString()}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transactions[index].title.toString(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                DateFormat.yMMMEd().format(
                                  DateTime.parse(
                                    transactions[index].date.toString(),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
