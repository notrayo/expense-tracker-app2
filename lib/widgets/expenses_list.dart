import 'package:expense_tracker2/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget({super.key, required this.expense});

  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) =>
          ExpenseItemWidget(expense: expense[index]),
    );
  }
}
