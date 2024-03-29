import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final dateFormatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fork_left_outlined,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.leisure: Icons.gamepad_outlined,
  Category.work: Icons.work_outline
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {
      //required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(date);
  }
}
