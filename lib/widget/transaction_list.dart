import 'package:expense_manager/modal/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'No Transactions added yet',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Row(children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                        "\$${transactions[index].amount.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ]));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
