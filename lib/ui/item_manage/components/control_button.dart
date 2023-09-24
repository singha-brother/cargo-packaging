import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import '../../../database/db.dart';
import '../../../providers/item_cargo_manager.dart';
import '../../widgets/my_flutter_app_icons.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    CargoItemManager cargoItemManager =
        Provider.of<CargoItemManager>(context, listen: false);
    TransportingItemsDao transportDao =
        Provider.of<AppDb>(context, listen: false).transportingItemsDao;
    CustomerItemsDao itemsDao =
        Provider.of<AppDb>(context, listen: false).customerItemsDao;

    bool isSelecting = Provider.of<CargoItemManager>(context).isSelecting;

    Future<void> putItemsToCar() async {
      List<int> selectedItems = cargoItemManager.selectedItems;
      int selectedCar = cargoItemManager.selectedIdx;

      for (int item in selectedItems) {
        transportDao.insertTransportingItems(
          TransportingItemsCompanion(
            itemId: d.Value(item),
            carId: d.Value(selectedCar),
            transportDate: d.Value(DateTime.now()),
          ),
        );

        // GET ITEM OBJECT
        CustomerItem itemObj = await itemsDao.getItemWithId(item);
        // Update item => onCar default false to true
        itemsDao.updateCustomerItem(
          itemObj.copyWith(isOnCar: true),
        );
      }

      cargoItemManager.cancelSelect();
      cargoItemManager.removeAllItems();
      Navigator.of(context).pop();
    }

    if (isSelecting) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('ကားပေါ်တင်မည်။'),
                    actions: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('မလုပ်ပါ'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: putItemsToCar,
                        child: const Text('တင်မည်'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Row(
              children: [
                Icon(CustomIcons.human_dolly),
                SizedBox(width: 5.0),
                Text('တင်ရန်')
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              cargoItemManager.cancelSelect();
              cargoItemManager.removeAllItems();
            },
            child: Text(
              'x ပယ်ဖျက်ရန်',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      );
    } else {
      return const Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Text(
          'ကားပေါ်တင်ရန် ပစ္စည်းများ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }
}
// onPressed: () async {
//               List<int> selectedItems = cargoItemManager.selectedItems;
//               int selectedCar = cargoItemManager.selectedIdx;

//               for (int item in selectedItems) {
//                 transportDao.insertTransportingItems(
//                   TransportingItemsCompanion(
//                     itemId: d.Value(item),
//                     carId: d.Value(selectedCar),
//                     transportDate: d.Value(DateTime.now()),
//                   ),
//                 );

//                 // GET ITEM OBJECT
//                 CustomerItem itemObj =
//                     await Provider.of<AppDb>(context, listen: false)
//                         .customerItemsDao
//                         .getItemWithId(item);
//                 // Update item => onCar default false to true
//                 Provider.of<AppDb>(context, listen: false)
//                     .customerItemsDao
//                     .updateCustomerItem(
//                       itemObj.copyWith(isOnCar: true),
//                     );
//               }

//               cargoItemManager.cancelSelect();
//               cargoItemManager.removeAllItems();
//             }

// showDialog(
//   context: context,
//   builder: (context) {
//     return AlertDialog(
//       title: const Text('Basic dialog title'),
//       content: SingleChildScrollView(
//         child:
//             const Text('A dialog is a type of modal window that'),
//       ),
//       actions: <Widget>[
//         TextButton(
//           style: TextButton.styleFrom(
//             textStyle: Theme.of(context).textTheme.labelLarge,
//           ),
//           child: const Text('Disable'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           style: TextButton.styleFrom(
//             textStyle: Theme.of(context).textTheme.labelLarge,
//           ),
//           child: const Text('Enable'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   },
// );