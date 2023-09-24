import 'package:cargo_packaging/ui/invoice_search/invoice_search_form.dart';
import 'package:flutter/material.dart';

class InvoiceSearchBox extends StatelessWidget {
  const InvoiceSearchBox({
    super.key,
    required this.isNotCheckout,
    required this.setIsNotCheckout,
    required this.customerNames,
    required this.receiverNames,
    required this.setSelectedCustomerName,
    required this.setSelectedReceiverName,
    required this.refreshSearching,
  });

  final bool isNotCheckout;
  final void Function(bool value) setIsNotCheckout;
  final List<String> customerNames;
  final List<String> receiverNames;
  final void Function(String value) setSelectedCustomerName;
  final void Function(String value) setSelectedReceiverName;
  final void Function() refreshSearching;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return InvoiceSearchForm(
                    receiverNames: receiverNames,
                    customerNames: customerNames,
                    setSelectedCustomerName: setSelectedCustomerName,
                    setSelectedReceiverName: setSelectedReceiverName,
                  );
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text('Search Here'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Switch(
            activeColor: Theme.of(context).colorScheme.primary,
            value: isNotCheckout,
            onChanged: setIsNotCheckout,
          ),
          const Spacer(),
          IconButton(
            iconSize: 30,
            onPressed: () {
              refreshSearching();
            },
            icon: const Icon(Icons.refresh_sharp),
          )
        ],
      ),
    );
  }
}
