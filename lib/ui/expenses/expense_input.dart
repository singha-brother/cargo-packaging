import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../widgets/custom_intput_field.dart';
import '../../utils/form_text_validation.dart';
import '../../database/db.dart';
// import 'package:cargo_packaging/home.dart';
// import 'expense.dart';

class ExpenseInputScreen extends StatefulWidget {
  const ExpenseInputScreen({super.key, this.originalExpense})
      : isUpdating = (originalExpense != null);
  final Expense? originalExpense;
  final bool isUpdating;

  @override
  State<ExpenseInputScreen> createState() => _ExpenseInputScreenState();
}

class _ExpenseInputScreenState extends State<ExpenseInputScreen> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  String _description = '';
  String _amount = '';
  DateTime _date = DateTime.now();
  int? _selectedDriverId;
  int? _selectedCarId;
  List<Driver> drivers = [];
  List<Car> cars = [];

  @override
  void initState() {
    // : implement initState
    super.initState();
    if (!context.mounted) return;
    final originalExpense = widget.originalExpense;
    if (originalExpense != null) {
      _descriptionController.text = originalExpense.description ?? '';
      _description = originalExpense.description ?? '';
      _amountController.text = originalExpense.amount.toString();
      _amount = originalExpense.amount.toString();
      _date = originalExpense.date;
    }

    () async {
      List<Driver> driversDb = await Provider.of<AppDb>(context, listen: false)
          .driversDao
          .getPresentDrivers();
      List<Car> carsDb = await Provider.of<AppDb>(context, listen: false)
          .carsDao
          .getPresentCars();
      setState(() {
        drivers = driversDb;
        cars = carsDb;
      });
    }();

    _descriptionController.addListener(() {
      setState(() {
        _description = _descriptionController.text;
      });
    });

    _amountController.addListener(() {
      setState(() {
        _amount = _amountController.text;
      });
    });
  }

  @override
  void dispose() {
    // : implement dispose
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Input'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_as),
            onPressed: () {
              if (!widget.isUpdating) {
                Provider.of<AppDb>(context, listen: false)
                    .expensesDao
                    .insertExpense(ExpensesCompanion(
                      description: d.Value(_description),
                      amount: d.Value(int.parse(_amount)),
                      driverId: d.Value(_selectedDriverId ?? drivers.first.id),
                      carId: d.Value(_selectedCarId ?? cars.first.id),
                      date: d.Value(_date),
                    ));
              } else {
                Provider.of<AppDb>(context, listen: false)
                    .expensesDao
                    .updateExpense(widget.originalExpense!.copyWith(
                      description: d.Value(_description),
                      amount: int.parse(_amount),
                      driverId: _selectedDriverId ?? drivers.first.id,
                      carId: _selectedCarId ?? cars.first.id,
                      date: _date,
                    ));
              }
              Navigator.pop(context);
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const HomeScreen(selectIdx: 3),
              //       ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            children: [
              CustomInputField(
                labelText: 'Description',
                validator: textValidation('description'),
                controller: _descriptionController,
              ),
              const SizedBox(height: 15.0),
              CustomInputField(
                labelText: 'Amount',
                validator: numberValidation('Amount'),
                controller: _amountController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 15.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose Driver'),
                  Text('Choose Car'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DriverDropdown(
                    driverId: _selectedDriverId,
                    drivers: drivers,
                    changeHandler: (newId) {
                      setState(() {
                        _selectedDriverId = newId;
                      });
                    },
                  ),
                  CarDropdown(
                    carId: _selectedCarId,
                    cars: cars,
                    changeHandler: (newId) {
                      setState(() {
                        _selectedCarId = newId;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 30.0),
              _buildDatePicker(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat.yMMMEd().format(_date),
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.date_range),
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: _date,
              firstDate: DateTime(2023),
              lastDate: DateTime(_date.year, _date.month, _date.day + 5),
            );

            setState(() {
              if (selectedDate != null) {
                _date = selectedDate;
              }
            });
          },
        ),
      ],
    );
  }
}

class DriverDropdown extends StatelessWidget {
  const DriverDropdown(
      {super.key, required this.drivers, this.changeHandler, this.driverId});
  final int? driverId;
  final Function(int?)? changeHandler;
  final List<Driver> drivers;

  @override
  Widget build(BuildContext context) {
    if (drivers.isEmpty) {
      return const Expanded(child: Text('ရွေးချယ်စရာ ကားဆရာ မရှိပါ။'));
    } else {
      List<DropdownMenuItem<int>> dropdownItems = drivers.map((Driver driver) {
        return DropdownMenuItem(
          value: driver.id,
          child: Text(driver.driverName),
        );
      }).toList();
      return DropdownButton<int>(
          value: driverId ?? drivers.first.id,
          items: dropdownItems,
          onChanged: changeHandler);
    }
  }
}

class CarDropdown extends StatelessWidget {
  const CarDropdown(
      {super.key, required this.cars, this.changeHandler, this.carId});
  final int? carId;
  final Function(int?)? changeHandler;
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    if (cars.isEmpty) {
      return const Expanded(child: Text('ရွေးချယ်စရာ ကားမရှိပါ။'));
    } else {
      List<DropdownMenuItem<int>> dropdownItems = cars.map((Car car) {
        return DropdownMenuItem(
          value: car.id,
          child: Text(car.carNumber),
        );
      }).toList();
      return DropdownButton<int>(
          value: carId ?? cars.first.id,
          items: dropdownItems,
          onChanged: changeHandler);
    }
  }
}
