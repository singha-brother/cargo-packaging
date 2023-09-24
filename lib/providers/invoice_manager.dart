import 'package:cargo_packaging/database/db.dart';
import 'package:flutter/material.dart';

class InvoiceManager extends ChangeNotifier {
  List<CustomerInvoice> invoices = [];

  void setInvoices(List<CustomerInvoice> invoicesDb) {
    invoices = List.of(invoicesDb);
    notifyListeners();
  }
}
