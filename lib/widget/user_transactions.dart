import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../modal/transaction.dart';

class UserTranactions extends StatefulWidget {
  @override
  _UserTranactionsState createState() => _UserTranactionsState();
}

class _UserTranactionsState extends State<UserTranactions> {
  final List<Transaction> _userTranasction = [
    Transaction('123', 'Internet', 2000, DateTime.now()),
    Transaction('124', 'Fuel', 1500, DateTime.now())
  ];

  void addNewTransaction(String title, double amount) {
    final newTx = Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    setState(() {
      _userTranasction.add(newTx);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction),
        TransactionList(_userTranasction),
      ],
    );
  }
}
