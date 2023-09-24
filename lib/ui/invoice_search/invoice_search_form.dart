import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class InvoiceSearchForm extends StatefulWidget {
  const InvoiceSearchForm({
    super.key,
    required this.customerNames,
    required this.receiverNames,
    required this.setSelectedCustomerName,
    required this.setSelectedReceiverName,
  });
  final List<String> customerNames;
  final List<String> receiverNames;
  final void Function(String value) setSelectedCustomerName;
  final void Function(String value) setSelectedReceiverName;

  @override
  State<InvoiceSearchForm> createState() => _InvoiceSearchFormState();
}

class _InvoiceSearchFormState extends State<InvoiceSearchForm> {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: customerNameController,
              decoration: const InputDecoration(
                labelText: 'ပေးပို့သူနာမည်',
              ),
            ),
            suggestionsCallback: (pattern) {
              return widget.customerNames.where((e) => e.contains(pattern));
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              customerNameController.text = suggestion;
            },
          ),
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: receiverNameController,
              decoration: const InputDecoration(
                labelText: 'လက်ခံသူနာမည်',
              ),
            ),
            suggestionsCallback: (pattern) {
              return widget.receiverNames.where((e) => e.contains(pattern));
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              receiverNameController.text = suggestion;
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              widget.setSelectedCustomerName(customerNameController.text);
              widget.setSelectedReceiverName(receiverNameController.text);
              Navigator.of(context).pop();
            },
            style: const ButtonStyle().copyWith(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Theme.of(context).primaryColor),
                foregroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary,
                )),
            child: const Text('ရှာဖွေရန်'),
          )
        ],
      ),
    );
  }
}
