import 'package:cargo_packaging/database/db.dart';
// import 'package:cargo_packaging/providers/invoice_manager.dart';
import 'package:cargo_packaging/ui/invoice_search/search_box.dart';
import 'package:cargo_packaging/ui/item_register/components/invoices_invoice_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceSearchScreen extends StatefulWidget {
  const InvoiceSearchScreen({super.key});

  @override
  State<InvoiceSearchScreen> createState() => _InvoiceSearchScreenState();
}

class _InvoiceSearchScreenState extends State<InvoiceSearchScreen> {
  List<CustomerInvoice> invoices = [];
  List<String> customerNames = [];
  List<String> receiverNames = [];
  String selectedCustomerName = '';
  String selectedReceiverName = '';

  bool isNotCheckout = false;

  @override
  void initState() {
    // : implement initState
    super.initState();

    () async {
      var invoicesDb = await Provider.of<AppDb>(context, listen: false)
          .customerInvoicesDao
          .getCustomerInvoices();

      setState(() {
        invoices = invoicesDb;
        customerNames =
            invoices.map((invoice) => invoice.customerName).toSet().toList();
        receiverNames =
            invoices.map((invoice) => invoice.receiverName).toSet().toList();
        customerNames.sort();
        receiverNames.sort();
      });
    }();
  }

  void setIsNotCheckout(value) {
    setState(() {
      isNotCheckout = value;
    });
  }

  void setSelectedCustomerName(String value) {
    setState(() {
      selectedCustomerName = value;
    });
  }

  void setSelectedReceiverName(String value) {
    setState(() {
      selectedReceiverName = value;
    });
  }

  void refreshSearching() {
    setState(() {
      isNotCheckout = false;
      selectedCustomerName = '';
      selectedReceiverName = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CustomerInvoice> showInvoices = List.from(invoices);
    if (isNotCheckout) {
      showInvoices = invoices.where((inv) => !inv.isCheckOut).toList();
    }

    if (selectedCustomerName.isNotEmpty) {
      showInvoices = showInvoices
          .where((inv) => inv.customerName == selectedCustomerName)
          .toList();
    }

    if (selectedReceiverName.isNotEmpty) {
      showInvoices = showInvoices
          .where((inv) => inv.receiverName == selectedReceiverName)
          .toList();
    }

    const double searchBoxHeight = 70;
    final restHeight =
        MediaQuery.of(context).size.height - 70 - AppBar().preferredSize.height;

    if (invoices.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        SizedBox(
          height: searchBoxHeight,
          child: InvoiceSearchBox(
            isNotCheckout: isNotCheckout,
            setIsNotCheckout: setIsNotCheckout,
            customerNames: customerNames,
            receiverNames: receiverNames,
            setSelectedCustomerName: setSelectedCustomerName,
            setSelectedReceiverName: setSelectedReceiverName,
            refreshSearching: refreshSearching,
          ),
        ),
        SizedBox(
          height: restHeight,
          child: SearchInvoicesList(invoices: showInvoices),
        )
      ],
    );
  }
}

class SearchInvoicesList extends StatelessWidget {
  const SearchInvoicesList({super.key, required this.invoices});
  final List<CustomerInvoice> invoices;

  @override
  Widget build(BuildContext context) {
    // : implement build
    return ListView.separated(
        itemBuilder: (context, index) {
          return InvoiceTile(invoice: invoices[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: invoices.length);
    // return FutureBuilder(
    //   future: invoices,
    //   builder: (BuildContext context,
    //       AsyncSnapshot<List<CustomerInvoice>> snapshot) {
    //     if (snapshot.hasData && snapshot.data != null) {
    //       List<CustomerInvoice> invoices = snapshot.data!;
    //       return ListView.separated(
    //           itemBuilder: (context, index) {
    //             return InvoiceTile(invoice: invoices[index]);
    //           },
    //           separatorBuilder: (context, index) => const SizedBox(height: 20),
    //           itemCount: invoices.length);
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // );
  }
}
