import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function submitTransaction;

  NewTransaction({
    Key? key,
    required this.submitTransaction,
  }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final price = double.parse(priceController.text);

    if (title.isEmpty || price <= 0) return;

    widget.submitTransaction(title, price);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: (val) => submitData(),
            ),
            TextButton(
                onPressed: () => submitData(), child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
