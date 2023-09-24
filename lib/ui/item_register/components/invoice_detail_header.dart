import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../database/db.dart';

class InvoiceDetailHeader extends StatelessWidget {
  const InvoiceDetailHeader({super.key, required this.invoice});
  final CustomerInvoice invoice;

  @override
  Widget build(BuildContext context) {
    String invoiceId = invoice.id.toString().padLeft(6, '0');
    String dateString = DateFormat.yMMMEd().format(invoice.date);
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# $invoiceId',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(height: 5.0),
            Text(invoice.customerName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5.0),
            Text(
              dateString,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
