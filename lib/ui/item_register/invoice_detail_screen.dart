import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import '../../database/query_models.dart';
import '../../providers/item_manager.dart';
import 'components/invoice_detail_header.dart';
import 'components/invoice_detail_section.dart';
import 'components/item_condition_tile.dart';

class InvoiceDetailScreen extends StatelessWidget {
  const InvoiceDetailScreen({super.key, required this.invoice});

  final CustomerInvoice invoice;

  @override
  Widget build(BuildContext context) {
    const List<Tab> tabs = [
      Tab(text: 'အသေးစိတ်'),
      Tab(text: 'ပစ္စည်းအခြေအနေ'),
      Tab(text: 'စီမံခန့်ခွဲရန်'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Detail'),
      ),
      body: ListView(
        children: [
          InvoiceDetailHeader(
            invoice: invoice,
          ),
          DefaultTabController(
            length: tabs.length,
            child: Column(
              children: [
                const TabBar(tabs: tabs),
                SizedBox(
                  height: 800,
                  child: TabBarView(children: [
                    ///////////////
                    // DEATIL TAB
                    FutureBuilder(
                        future: Provider.of<AppDb>(context)
                            .customerItemsDao
                            .getItemsWithInvoice(invoice.id),
                        builder: (context,
                            AsyncSnapshot<List<CustomerItem>> snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            List<CustomerItem> itemsFromDb =
                                snapshot.data ?? [];
                            List<Item> items = [];
                            for (CustomerItem itemFromDb in itemsFromDb) {
                              Item item = Item(
                                  name: itemFromDb.itemName,
                                  price: itemFromDb.price,
                                  quantity: itemFromDb.quantity);
                              items.add(item);
                            }
                            return InvoiceDetailSection(
                              invoice: invoice,
                              items: items,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),

                    /////////////////////
                    // ITEM CONDITION TAB
                    _buildItemConditionTab(context, invoice),
                    const SizedBox(
                      height: 100,
                      width: 100,
                      child: Text('Manage'),
                    ),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemConditionTab(context, invoice) {
    return FutureBuilder(
      future: Provider.of<AppDb>(context)
          .transportingItemsDao
          .getItemConditionByInvoiceId(invoice.id),
      builder: (context, AsyncSnapshot<List<ItemCondition>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final List<ItemCondition> items = snapshot.data ?? [];
          return ListView.separated(
            itemCount: items.length,
            itemBuilder: (context, index) {
              ItemCondition item = items[index];

              return ItemConditionTile(
                item: item,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10.0),
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
