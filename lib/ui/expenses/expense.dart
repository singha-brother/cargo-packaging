import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import '../../database/query_models.dart';
import '../widgets/my_flutter_app_icons.dart';
import './expense_input.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExpenseInputScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: _buildExpenses(context),
    );
  }

  Widget _buildExpenses(context) {
    return StreamBuilder(
      stream: Provider.of<AppDb>(context).expensesDao.watchAllExpenses(),
      builder: (context, AsyncSnapshot<List<ExpenseWithDriverCar>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<ExpenseWithDriverCar> expenses = snapshot.data ?? [];
          return ListView.separated(
              itemBuilder: (context, index) {
                return ExpenseTile(
                  expenseObj: expenses[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20.0,
                );
              },
              itemCount: expenses.length);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expenseObj});
  final ExpenseWithDriverCar expenseObj;

  @override
  Widget build(BuildContext context) {
    String dateStr = DateFormat.yMMMEd().format(expenseObj.expense.date);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpenseInputScreen(
              originalExpense: expenseObj.expense,
            ),
          ),
        );
      },
      child: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '# ${expenseObj.expense.id.toString().padLeft(5, '0')}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  Text(
                    dateStr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(CustomIcons.truck_fast),
                          const SizedBox(width: 10.0),
                          Text(expenseObj.car.carNumber),
                        ],
                      ),
                      Row(
                        children: [
                          // const SizedBox(width: 10.0),
                          const Icon(Icons.person),
                          const SizedBox(width: 10.0),
                          Text(expenseObj.driver.driverName),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        expenseObj.expense.amount.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Text('kyats'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Text(expenseObj.expense.description ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
