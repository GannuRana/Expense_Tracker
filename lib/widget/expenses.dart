import 'dart:html';

import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_lisst.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense=[
    Expense(
        title: 'flutter',
        amount: 20.0,
        date: DateTime.now(),
        category: Category.work
    ),
    Expense(
        title: 'cinema',
        amount: 15.0,
        date: DateTime.now(),
        category: Category.liesur,
    ),
  ];

  void _openAddExpenseOverlay(){
     showModalBottomSheet(
        isScrollControlled: true,
         context: context,
         builder: (ctx)=> NewExpense(onAddExpense: _addExpense,),
     );
}

void _addExpense(Expense expense){
    setState(() {
      _registeredExpense.add(expense);
    });
}
void removeExpense(Expense expense){
    final expenseIndex=_registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 3),
            content: Text('Content Deleted.'),
            action: SnackBarAction(
              label: 'undo',
              onPressed: (){
                setState(() {
                  _registeredExpense.insert(expenseIndex, expense);
                });
              },
            ),
        ),
    );
}


  @override
  Widget build(BuildContext context) {
    Widget mainContent=Center(
      child: Text(
        'No expenses found. Start adding some!'
      ),
    );
    if(_registeredExpense.isNotEmpty){
      mainContent=ExpensesList(
        expenses: _registeredExpense,
        onRemoveExpense: removeExpense,
      );

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpense),
          Expanded(
              child: mainContent,
          ),
        ],
      ),
    );
  }
}
