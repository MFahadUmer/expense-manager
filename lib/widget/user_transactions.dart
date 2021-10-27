import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../modal/transaction.dart';

class UserTranactions extends StatelessWidget {
  final List<Transaction> userTranasction;

  UserTranactions(this.userTranasction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NewTransaction(addNewTransaction),
        TransactionList(userTranasction),
      ],
    );
  }
}
