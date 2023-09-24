import 'package:flutter/material.dart';

import '../../../database/db.dart';
import '../../../providers/item_manager.dart';
import '../../widgets/my_flutter_app_icons.dart';
import 'items_table_section.dart';

class InvoiceDetailSection extends StatelessWidget {
  const InvoiceDetailSection(
      {super.key, required this.invoice, required this.items});
  final CustomerInvoice invoice;
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCustomerSection(context),
          const SizedBox(height: 15.0),
          _buildCheckoutSection(context),
          const SizedBox(height: 15.0),
          ItemsTableSection(items: items),
        ],
      ),
    );
  }

  Widget _buildCustomerSection(context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('မှ'),
                const SizedBox(height: 10.0),
                Text(invoice.customerName),
                Text(invoice.customerPhone ?? ''),
                Text(invoice.fromLocation),
                Text(invoice.fromTownship),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              CustomIcons.arrow_right_circle,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('သို့'),
                const SizedBox(height: 10.0),
                Text(invoice.receiverName),
                Text(invoice.receiverPhone ?? ''),
                Text(
                  invoice.toLocation,
                  textAlign: TextAlign.end,
                ),
                Text(invoice.toTownship),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(context) {
    return invoice.isCheckOut
        ? Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                const Text('ရှင်းပြီး'),
                const SizedBox(width: 10.0),
                Icon(
                  CustomIcons.check_decagram,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                const Text('မရှင်းရသေးပါ'),
                const SizedBox(width: 10.0),
                Icon(
                  CustomIcons.close_circle,
                  color: Theme.of(context).colorScheme.error,
                ),
              ],
            ),
          );
  }
}
