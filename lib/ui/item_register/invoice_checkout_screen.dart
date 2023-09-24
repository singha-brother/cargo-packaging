import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as d;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import '../../home.dart';
import '../../providers/customer_info_manager.dart';
import '../../providers/item_manager.dart';
import 'components/invoice_detail_section.dart';

TextStyle lightTextStyle = TextStyle(color: Colors.grey.shade500);
TextStyle boldTextStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.grey.shade700);
TextStyle mediumTextStyle =
    TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold);

class InvoiceCheckoutScreen extends StatelessWidget {
  const InvoiceCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // INITIATE VALUE FROM PROVIDER MANAGER
    ItemManager itemManager = context.read<ItemManager>();
    CustomerInfoManager customerInfoManager =
        context.read<CustomerInfoManager>();

    List<Item> items = itemManager.getItems;
    int grandTotal = itemManager.getGrandTotal();
    DateTime now = DateTime.now();
    String date = DateFormat.yMMMEd().format(now);
    String custName = customerInfoManager.name;
    String recvName = customerInfoManager.receiverName;
    String custPhone = customerInfoManager.customerPhone;
    String recvPhone = customerInfoManager.receiverPhone;
    String fromAddr = customerInfoManager.fromLocation;
    String toAddr = customerInfoManager.toLocation;
    String fromTownship = customerInfoManager.fromTownship;
    String toTownship = customerInfoManager.toTownship;
    bool isCheckOut = customerInfoManager.isCheckOut;

    CustomerInvoice invoice = CustomerInvoice(
      id: 0,
      customerName: custName,
      receiverName: recvName,
      fromLocation: fromAddr,
      toLocation: toAddr,
      totalPrice: 1,
      date: now,
      fromTownship: fromTownship,
      toTownship: toTownship,
      isCheckOut: isCheckOut,
      customerPhone: custPhone,
      receiverPhone: recvPhone,
    );

    //////////////////

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildHeaderDate(context, date),
          const SizedBox(height: 15.0),
          InvoiceDetailSection(invoice: invoice, items: items),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Save
              RawMaterialButton(
                fillColor: Colors.blue.shade800,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                elevation: 5.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                onPressed: () async {
                  // SAVE CUSTOMER INVOICE TABLE AND GET THE INVOICE ID

                  final CustomerInvoicesCompanion invoice =
                      CustomerInvoicesCompanion(
                    customerName: d.Value(custName),
                    customerPhone: d.Value(custPhone),
                    receiverName: d.Value(recvName),
                    receiverPhone: d.Value(recvPhone),
                    fromLocation: d.Value(fromAddr),
                    toLocation: d.Value(toAddr),
                    fromTownship: d.Value(fromTownship),
                    toTownship: d.Value(toTownship),
                    totalPrice: d.Value(grandTotal),
                    isCheckOut: d.Value(isCheckOut),
                    date: d.Value(now),
                  );

                  int invoiceId =
                      await Provider.of<AppDb>(context, listen: false)
                          .customerInvoicesDao
                          .insertCustomerInvoice(invoice);

                  // SAVE ALL ITEMS WITH ABOVE CUSTOMER ID

                  for (Item item in items) {
                    final customerItem = CustomerItemsCompanion(
                      customerInvoiceId: d.Value(invoiceId),
                      itemName: d.Value(item.name),
                      price: d.Value(item.price),
                      quantity: d.Value(item.quantity),
                    );
                    Provider.of<AppDb>(context, listen: false)
                        .customerItemsDao
                        .insertCustomerItem(customerItem);
                  }

                  // DOCUMENTATION SAID IT IS GOOD
                  if (!context.mounted) return;
                  customerInfoManager.resetCustomerInfo();
                  itemManager.removeAllItems();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: const Text('သိမ်းဆည်းပြီးပါပြီ...'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeScreen(),
                  //     ),
                  //     (route) => false);
                  // Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.print_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 7.0),
                    Text(
                      'Save',
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row _buildHeaderDate(BuildContext context, String date) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice',
                style: TextStyle(
                    fontSize: 25.0, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Date',
                style: lightTextStyle,
              ),
              Text(
                date,
                style: boldTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
