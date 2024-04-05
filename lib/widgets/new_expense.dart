import 'package:flutter/material.dart';
import '../models/expense.dart';

class NewExpenseWidget extends StatefulWidget {
  const NewExpenseWidget({super.key});

  @override
  State<NewExpenseWidget> createState() => _NewExpenseWidgetState();
}

class _NewExpenseWidgetState extends State<NewExpenseWidget> {
  Category _selectedCategory = Category.leisure;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 2, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //some form validation

  void _sumbitNewExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid == true ||
        _selectedDate == null) {
      //error message
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('invalid input submitted'),
                content: const Text(
                    'Please confirm if you entered the description, amount or date correctly, if at all'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Got it !'))
                ],
              ));
      return;
    }
  }

  //disposing the controller data to avoid unnecessary controller cache

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration:
                const InputDecoration(label: Text('what did you spend on ?')),
            maxLength: 50,
            //onChanged: _saveTitleInput
            controller: _titleController,
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    prefix: Text('Ksh. '),
                    label: Text('Amount spent ...'),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Select a Date : '
                          : dateFormatter.format(_selectedDate!),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          _presentDatePicker();
                        },
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          size: 32,
                        ))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButton(
              //hint: const Text('choose category : '),
              value: _selectedCategory,
              items: Category.values
                  .map((cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat.name.toUpperCase()),
                      ))
                  .toList(),
              onChanged: (value) {
                //print(value);
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              }),

          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _sumbitNewExpenseData();
                },
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
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 8, 3, 104)))
            ],
          )
        ],
      ),
    );
  }
}
