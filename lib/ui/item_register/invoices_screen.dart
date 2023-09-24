import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import 'components/invoices_invoice_tile.dart';
import 'info_register_screen.dart';

class CustomerInvoicesScreen extends StatefulWidget {
  const CustomerInvoicesScreen({super.key});

  @override
  State<CustomerInvoicesScreen> createState() => _CustomerInvoicesScreenState();
}

class _CustomerInvoicesScreenState extends State<CustomerInvoicesScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerItemRegisterScreen(),
              ),
            );
          }),
      body: Column(
        children: [
          _buildDatePicker(context),
          Expanded(child: _buildCustomerInvoices(context, selectedDate)),
        ],
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              setState(() {
                selectedDate = selectedDate.subtract(const Duration(days: 1));
              });
            },
          ),
          const SizedBox(width: 20.0),
          TextButton(
            child: Text(DateFormat.yMMMEd().format(selectedDate),
                style: Theme.of(context).textTheme.titleLarge),
            onPressed: () async {
              final currentDate = DateTime.now();
              final _selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(2023),
                  lastDate: currentDate);

              setState(() {
                if (_selectedDate != null) {
                  selectedDate = _selectedDate;
                }
              });
            },
          ),
          const SizedBox(width: 20.0),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              setState(() {
                if (selectedDate.day == DateTime.now().day) {
                  return;
                } else {
                  selectedDate = selectedDate.add(const Duration(days: 1));
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerInvoices(context, date) {
    DateTime today = DateTime.now();
    return FutureBuilder(
      future: Provider.of<AppDb>(context)
          .customerInvoicesDao
          .getCustomerInvoicesByDate(date),
      // .getCustomerInvoices(),
      builder: (BuildContext context,
          AsyncSnapshot<List<CustomerInvoice>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<CustomerInvoice> items = snapshot.data ?? [];

          if (items.isEmpty && date.day == today.day) {
            return const Center(
              child: Text('ယနေ့အတွက် အမှာစာများ မရှိသေးပါ။'),
            );
          } else if (items.isEmpty) {
            return const Center(
              child: Text('အမှာစာများ မရှိပါ။'),
            );
          }
          return ListView.separated(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InvoiceTile(invoice: items[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15.0);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
