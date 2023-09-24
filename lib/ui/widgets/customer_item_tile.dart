import 'package:flutter/material.dart';

import '../../providers/item_manager.dart';
import 'my_flutter_app_icons.dart';

class CustomerItemTile extends StatelessWidget {
  const CustomerItemTile({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(CustomIcons.archive_outline),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('${item.quantity} x ${item.price}'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                (item.quantity * item.price).toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
