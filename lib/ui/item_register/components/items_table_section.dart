import 'package:flutter/material.dart';

import '../../../providers/item_manager.dart';
import '../../widgets/customer_item_tile.dart';

class ItemsTableSection extends StatelessWidget {
  const ItemsTableSection({super.key, required this.items});
  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    int totalPrice =
        items.fold(0, (prev, item) => (item.price * item.quantity) + prev);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ပစ္စည်းများ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                'ကျသင့်ငွေ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const Divider(),
          ListView.separated(
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10.0);
            },
            itemBuilder: (context, index) {
              return CustomerItemTile(item: items[index]);
            },
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'စုစုပေါင်းကျသင့်ငွေ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    totalPrice.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'kyats',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
