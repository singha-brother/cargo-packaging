import 'dart:io';
import 'dart:typed_data';

import 'package:cargo_packaging/database/db.dart';
// import 'package:cargo_packaging/database/query_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintTest extends StatelessWidget {
  const PrintTest({super.key});

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);
    final appDocDir = await getApplicationDocumentsDirectory();
    final file = File('$appDocDir/document.pdf');
    await file.writeAsBytes(bytes);
  }

  @override
  Widget build(BuildContext context) {
    final actions = <PdfPreviewAction>[
      PdfPreviewAction(
        icon: const Icon(Icons.save),
        onPressed: _saveAsFile,
      )
    ];
    return Scaffold(
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => generateItemList(format),
        actions: actions,
      ),
    );
  }
}

Future<Uint8List> generateItemList(PdfPageFormat pageFormat) async {
  final items = <CustomerItem>[
    const CustomerItem(
        id: 1,
        customerInvoiceId: 1,
        itemName: 'Big Box',
        quantity: 10,
        price: 1000,
        isOnCar: true),
    const CustomerItem(
        id: 1,
        customerInvoiceId: 1,
        itemName: 'Big Box',
        quantity: 10,
        price: 1000,
        isOnCar: true),
    const CustomerItem(
        id: 1,
        customerInvoiceId: 1,
        itemName: 'Big Box',
        quantity: 10,
        price: 1000,
        isOnCar: true),
    const CustomerItem(
        id: 1,
        customerInvoiceId: 1,
        itemName: 'Big Box',
        quantity: 10,
        price: 1000,
        isOnCar: true),
    const CustomerItem(
        id: 1,
        customerInvoiceId: 1,
        itemName: 'Big Box',
        quantity: 10,
        price: 1000,
        isOnCar: true),
    const CustomerItem(
        id: 1,
        customerInvoiceId: 1,
        itemName: 'Big Box',
        quantity: 10,
        price: 1000,
        isOnCar: true),
  ];

  final printItemOnCar =
      PrintItemOnCar(items: items, carNumber: '7W-9999', driverName: 'Soe Aye');

  return await printItemOnCar.buildPdf(pageFormat);
}

class PrintItemOnCar {
  final List<CustomerItem> items;
  final String carNumber;
  final String driverName;
  PrintItemOnCar(
      {required this.items, required this.carNumber, required this.driverName});

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    final doc = pw.Document();
    var data = await rootBundle.load('assets/pyidaungsu-253.ttf');
    var font = pw.Font.ttf(data);
    doc.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Text('မြန်မာလိုရလား', style: pw.TextStyle(font: font)),
            pw.Text(fixFont('စမ်းကြည့်သည်။ မှန်ပါကွယ်။ စေ'),
                style: pw.TextStyle(font: font)),
            pw.Text('ကြည့်ကြည့်', style: pw.TextStyle(font: font)),
            pw.Text(fixFont('ကြည့်ကြည့်'), style: pw.TextStyle(font: font)),
          ];
        },
      ),
    );

    return doc.save();
  }
}

String fixFont(String text) {
  try {
    if (text.isEmpty) return '';
    List<String> sentences = text.split("\n");
    StringBuffer stringBuilder = StringBuffer();
    for (String sentence in sentences) {
      List<String> charArr = sentence.split("");
      List<String?> fixCharArr = List.filled(charArr.length + 5, '');

      for (int i = 0; i < charArr.length; i++) {
        String currentChar = charArr[i];
        if (currentChar == "\u1031") {
          // ေ
          if (i > 0 &&
              !charArr[i - 1].contains(RegExp("[\u103c\u103b\u103d]"))) {
            // if not ေ colse to ြ && //if not ေ colse to ျ
            fixCharArr[i - 1] = currentChar;
            fixCharArr[i] = charArr[i - 1];
          } else if (i > 1 && charArr[i - 1] == "\u103d") {
            // - ွ ေ (ေ with - ွ)
            fixCharArr[i - 2] = currentChar;
            fixCharArr[i] = charArr[i - 1];
            fixCharArr[i - 1] = charArr[i - 2];
          }
        } else if (currentChar == "\u103a" &&
            (i + 2) < charArr.length &&
            charArr[i + 2] == "\u103c") {
          // ် with ြ
          charArr.insert(i + 1, " ");
          fixCharArr[i] = currentChar;
          fixCharArr[i + 1] = charArr[i + 1];
        } else if (currentChar == "\u103c") {
          // ြ
          if ((i + 1) < charArr.length && charArr[i + 1] == "\u1031") {
            // ြ with ေ
            if (i > 0 && i < charArr.length - 1) {
              fixCharArr[i] = currentChar;
              fixCharArr[i - 1] = charArr[i + 1];
              fixCharArr[i + 1] = charArr[i - 1];
            }
          } else {
            // ြ without ေ
            fixCharArr[i] = charArr[i - 1];
            fixCharArr[i - 1] = currentChar;
          }
        } else if (currentChar == "\u103b") {
          // ျ
          if ((i + 1) < charArr.length && charArr[i + 1] == "\u1031") {
            // ျ with ေ
            fixCharArr[i - 1] = charArr[i + 1];
            fixCharArr[i + 1] = currentChar;
            fixCharArr[i] = charArr[i - 1];
          } else {
            // ျ without ေ
            fixCharArr[i] = currentChar;
          }
        } else {
          fixCharArr[i] = currentChar;
        }
      }
      for (int j = 0; j < fixCharArr.length; j++) {
        if (fixCharArr[j] != null) {
          stringBuilder.write(fixCharArr[j]!);
        }
      }
      stringBuilder.write("\n");
    }
    return stringBuilder.toString();
  } catch (e) {
    return text;
  }
}
