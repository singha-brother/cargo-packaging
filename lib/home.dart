import 'package:cargo_packaging/ui/invoice_search/invoice_search.dart';

import 'ui/print_bluetooth.dart';
import 'ui/print_test.dart';
import 'ui/reports.dart';
import 'ui/widgets/my_flutter_app_icons.dart';
import 'ui/item_manage/cargo_items.dart';
import 'ui/expenses/expense.dart';
import 'ui/car_driver_manage/manage_car_list_screen.dart';
import 'ui/item_register/invoices_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.selectIdx});
  final int? selectIdx;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const CustomerInvoicesScreen(),
    const InvoiceSearchScreen(),
    const CargoItemsScreen(),
    const ManageCarListScreen(),
    const ExpenseScreen(),
    const ReportScreen(),
    const PrintTest(),
    const BluetoothPrintingScreen(),
  ];

  @override
  void initState() {
    // : implement initState
    super.initState();
    if (widget.selectIdx != null) {
      _selectIndex = widget.selectIdx!;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Client Name')),
      body: _widgetOptions[_selectIndex],
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Center(
                  child: Text(
                'Client Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              )),
            ),
            ListTile(
              title: const Text('ကုန်ပစ္စည်းလက်ခံရန်'),
              leading: const Icon(CustomIcons.file_account),
              onTap: () {
                _onItemTapped(0);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('ရှာဖွေရန်'),
              leading: const Icon(Icons.search),
              onTap: () {
                _onItemTapped(1);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
                title: const Text('ကုန်ပစ္စည်းကားပေါ်တင်ရန်'),
                leading: const Icon(CustomIcons.human_dolly),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: const Text('ကားနှင့် ဒရိုင်ဘာ စီမံခန့်ခွဲရန်'),
                leading: const Icon(CustomIcons.truck_check),
                onTap: () {
                  _onItemTapped(3);
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: const Text('အသုံးစာရင်း'),
                leading: const Icon(CustomIcons.cash_multiple),
                onTap: () {
                  _onItemTapped(4);
                  Navigator.of(context).pop();
                }),
            ListTile(
              title: const Text('Reports'),
              leading: const Icon(CustomIcons.monitor_dashboard),
              onTap: () {
                _onItemTapped(5);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Printest'),
              leading: const Icon(Icons.print),
              onTap: () {
                _onItemTapped(6);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('BluetoothPrintest'),
              leading: const Icon(Icons.print),
              onTap: () {
                _onItemTapped(7);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
