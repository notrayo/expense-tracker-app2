import 'package:expense_tracker2/models/expense.dart';
import 'package:expense_tracker2/widgets/expenses_list.dart';
import 'package:expense_tracker2/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //some dummy data

  final List<Expense> _dummyExpenses = [
    Expense(
        title: 'Flutter Udemy Course',
        amount: 1100.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Dune 2 Cinema Ticket',
        amount: 800.00,
        date: DateTime(2023, 3, 1),
        category: Category.leisure),
    Expense(
        title: 'football boots',
        amount: 3500.00,
        date: DateTime(2024, 22, 04),
        category: Category.leisure)
  ];

  @override
  void _addNewExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) => NewExpenseWidget(
              onAddExpense: _newExpense,
            )));
  }

  void _newExpense(Expense expense) {
    setState(() {
      _dummyExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _dummyExpenses.remove(expense);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _addNewExpense,
              icon: const Icon(
                Icons.add,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('     Recent Expenses ...'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ExpensesListWidget(
              expense: _dummyExpenses,
              onRemoveExpense: _removeExpense,
            ))
          ],
        ),
      ),
    );
  }
}
