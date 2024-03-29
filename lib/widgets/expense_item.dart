import 'package:expense_tracker2/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItemWidget extends StatelessWidget {
  const ExpenseItemWidget({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [Text('KSH. ${expense.amount.toStringAsFixed(2)}')],
            )
          ],
        ),
      ),
    );
  }
}
