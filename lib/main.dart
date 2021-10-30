import 'package:expense_manager/widget/chart.dart';
import 'package:flutter/material.dart';

import './widget/transaction_list.dart';
import './widget/new_transaction.dart';
import './modal/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.indigo,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        fontFamily: 'Quicksand',
      ),
      title: 'Personal Expenses',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTranasction = [];

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _userTranasction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(DateTime.now().toString(), title, amount, date);
    setState(() {
      _userTranasction.add(newTx);
    });
  }

  void deleteTransactions(String id) {
    setState(() {
      _userTranasction.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          IconButton(
            onPressed: () => startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(_recentTransactions),
              TransactionList(_userTranasction, deleteTransactions),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
