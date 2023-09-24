import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../database/query_models.dart';
import '../../widgets/my_flutter_app_icons.dart';

class ItemConditionTile extends StatelessWidget {
  const ItemConditionTile({super.key, required this.item});
  final ItemCondition item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(CustomIcons.archive_outline),
                    const SizedBox(width: 25.0),
                    Text(
                        '${item.customerItem.itemName} (${item.customerItem.quantity})'),
                  ],
                ),
                const SizedBox(height: 10.0),
                !item.customerItem.isOnCar
                    ? Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            child: Icon(
                              CustomIcons.human_dolly,
                              color: Theme.of(context).colorScheme.onError,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          const Text('ကားပေါ်သို့ မတင်ရသေးပါ။'),
                        ],
                      )
                    : !item.transportingItem!.isArrived
                        ? Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Icon(
                                  CustomIcons.archive_check,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(item.car?.carNumber ?? ''),
                              const SizedBox(width: 5.0),
                              const Text('ကားပေါ်သို့တင်ပြီး။')
                            ],
                          )
                        : Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Icon(
                                  CustomIcons.truck_check,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ပို့ဆောင်ပြီး။'),
                                  Text(DateFormat.yMMMEd().format(
                                      item.transportingItem!.transportDate))
                                ],
                              ),
                            ],
                          )
              ],
            ),
          ),
          !item.customerItem.isOnCar
              ? const Icon(CustomIcons.arrow_right_thick)
              : item.transportingItem!.isArrived
                  ? Column(
                      children: [
                        Text(
                          item.car?.carNumber ?? '',
                        ),
                        Text(
                          item.driver?.driverName ?? '',
                        )
                      ],
                    )
                  : const Icon(CustomIcons.arrow_right_thick)
        ],
      ),
    );
  }
}
