import 'package:cargo_packaging/database/db.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'widgets/my_flutter_app_icons.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        const Text(
          'SUMMARY',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        _buildItemNotOnCar(context),
        _buildItemLeftToTransport(context),
        _buildNumberOfInvoices(context),
        _buildItemTransported(context),
      ],
    );
  }

  Widget _buildItemNotOnCar(context) {
    return FutureBuilder(
      future: Provider.of<AppDb>(context)
          .customerItemsDao
          .getNumberOfItemsNotOnCar(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return SummaryCard(
            icon: CustomIcons.human_dolly,
            iconBgColor: Theme.of(context).colorScheme.error,
            description: 'ကားပေါ်သို့ တင်ရန် ကျန်ရှိသော ပစ္စည်း',
            number: snapshot.data ?? 0,
            isRoutable: true,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildItemLeftToTransport(context) {
    return FutureBuilder(
      future: Provider.of<AppDb>(context)
          .transportingItemsDao
          .getNumberOfItemsToTransport(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return SummaryCard(
            icon: CustomIcons.archive_check,
            iconBgColor: Theme.of(context).primaryColor,
            description: 'ကားပေါ်ရှိ ပို့ဆောင်ရန် ကျန်သော ပစ္စည်း',
            number: snapshot.data ?? 0,
            isRoutable: true,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildNumberOfInvoices(context) {
    return FutureBuilder(
      future:
          Provider.of<AppDb>(context).customerInvoicesDao.getNumberOfInvoices(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return SummaryCard(
            icon: CustomIcons.file_document_check,
            iconBgColor: Colors.green,
            description: 'ဘောင်ချာအရေအတွက်',
            number: snapshot.data ?? 0,
            isRoutable: false,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildItemTransported(context) {
    return FutureBuilder(
      future: Provider.of<AppDb>(context)
          .transportingItemsDao
          .getNumberOfItemsTransported(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return SummaryCard(
            icon: CustomIcons.truck_fast,
            iconBgColor: Theme.of(context).primaryColor,
            description: 'စုစုပေါင်းပို့ပြီးသော ပစ္စည်းများ',
            number: snapshot.data ?? 0,
            isRoutable: false,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.number,
    required this.description,
    required this.isRoutable,
  });
  final IconData icon;
  final Color iconBgColor;
  final int number;
  final String description;
  final bool isRoutable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2.0,
            offset: const Offset(1, 1),
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: iconBgColor,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      number.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(description),
                  ],
                ),
              ),
              isRoutable
                  ? const Icon(CustomIcons.arrow_right_circle)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
