import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../database/query_models.dart';
import '../../../providers/item_cargo_manager.dart';
import '../../widgets/my_flutter_app_icons.dart';

class TransportItemTile extends StatelessWidget {
  const TransportItemTile(
      {super.key, required this.itemWithInfo, this.isSelecting = false});

  final ItemWithCustomerInvoice itemWithInfo;
  final bool? isSelecting;

  @override
  Widget build(BuildContext context) {
    List<int> selectedItems =
        Provider.of<CargoItemManager>(context, listen: false).selectedItems;
    int itemId = itemWithInfo.customerItem.id;
    bool isSelectedItem = selectedItems.contains(itemId);
    TextStyle? boldText =
        isSelectedItem ? const TextStyle(fontWeight: FontWeight.bold) : null;
    return GestureDetector(
      onTap: () {
        if (isSelecting!) {
          if (isSelectedItem) {
            Provider.of<CargoItemManager>(context, listen: false)
                .removeItem(itemId);
          } else {
            Provider.of<CargoItemManager>(context, listen: false)
                .addItem(itemId);
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: isSelectedItem ? Colors.blue.shade100 : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2), // Changes the position of the shadow
            ),
          ],
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  CustomIcons.archive_outline,
                  color: Color(0xff555555),
                ),
                const SizedBox(width: 10.0),
                Text(
                  '${itemWithInfo.customerItem.itemName} (${itemWithInfo.customerItem.quantity})',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(itemWithInfo.customerInvoice.customerName,
                          style: boldText),
                      Text(
                        itemWithInfo.customerInvoice.fromTownship,
                        style: boldText,
                      ),
                      Text(
                        itemWithInfo.customerInvoice.customerPhone ?? '',
                        style: boldText,
                      )
                    ],
                  ),
                ),
                const Icon(
                  CustomIcons.arrow_right_circle,
                  color: Color(0xff555555),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(itemWithInfo.customerInvoice.receiverName,
                        style: boldText),
                    Text(itemWithInfo.customerInvoice.toTownship,
                        style: boldText),
                    Text(itemWithInfo.customerInvoice.receiverPhone ?? '',
                        style: boldText)
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
