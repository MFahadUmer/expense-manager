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
  final List<Transaction> _userTranasction = [
    // Transaction('123', 'Internet', 2000, DateTime.now()),
    // Transaction('124', 'Fuel', 1500, DateTime.now())
  ];

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

  void addNewTransaction(String title, double amount) {
    final newTx =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    setState(() {
      _userTranasction.add(newTx);
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
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Chart'),
                  elevation: 5,
                ),
              ),
              TransactionList(_userTranasction),
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
