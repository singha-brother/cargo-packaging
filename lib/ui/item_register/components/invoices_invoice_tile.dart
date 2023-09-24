import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../database/db.dart';
import '../../widgets/my_flutter_app_icons.dart';
import '../invoice_detail_screen.dart';

class InvoiceTile extends StatelessWidget {
  const InvoiceTile({super.key, required this.invoice});
  final CustomerInvoice invoice;
  @override
  Widget build(BuildContext context) {
    String invoiceId = invoice.id.toString().padLeft(6, '0');
    String dateString = DateFormat.yMMMEd().format(invoice.date);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InvoiceDetailScreen(
              invoice: invoice,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(
            left: BorderSide(
              width: 5,
              color: invoice.isCheckOut
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '# $invoiceId',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      Text(
                        dateString,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  if (invoice.isCheckOut)
                    SizedBox(
                      child: Row(
                        children: [
                          const Text('ရှင်းပြီး'),
                          const SizedBox(width: 5.0),
                          Icon(
                            CustomIcons.check_decagram,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    )
                  else
                    SizedBox(
                      child: Row(
                        children: [
                          const Text('မရှင်းရသေး'),
                          const SizedBox(width: 5.0),
                          Icon(
                            CustomIcons.close_circle,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              // const Divider(),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          invoice.customerName,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(invoice.fromTownship)
                      ],
                    ),
                  ),
                  const Icon(CustomIcons.arrow_right_thick),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(invoice.receiverName),
                        Text(invoice.toTownship)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
