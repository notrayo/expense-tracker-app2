import 'package:flutter/material.dart';

class NewExpenseWidget extends StatefulWidget {
  const NewExpenseWidget({super.key});

  @override
  State<NewExpenseWidget> createState() => _NewExpenseWidgetState();
}

class _NewExpenseWidgetState extends State<NewExpenseWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(label: Text('what did you spend on ?')),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: const Text(
              'Add Expense',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 240, 217, 9)),
          )
          // Row(
          //   children: [
          //     const TextField(
          //       decoration: InputDecoration(
          //         label: Text('amount spent ?'),
          //       ),
          //       keyboardType: TextInputType.number,
          //     ),
          //     IconButton(
          //         onPressed: () {},
          //         icon: const Icon(Icons.calendar_month_outlined))
          //   ],
          // )
        ],
      ),
    );
  }
}
