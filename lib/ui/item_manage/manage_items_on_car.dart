import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import '../../database/query_models.dart';
import '../../providers/item_cargo_manager.dart';
import '../widgets/my_flutter_app_icons.dart';
import 'components/transport_item_tile.dart';

class ManageItemsOnCarScreen extends StatelessWidget {
  const ManageItemsOnCarScreen({super.key, required this.car});

  final Car car;
  @override
  Widget build(BuildContext context) {
    String now = DateFormat.yMMMEd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Items On Car'),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 30.0),
                    child: Row(
                      children: [
                        const Icon(CustomIcons.truck_fast, color: Colors.white),
                        const SizedBox(width: 10.0),
                        Text(
                          car.carNumber,
                          style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(now,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10.0),
                      // const Text('ကားဆရာရွေးရန်'),
                      DriverDropdown(carId: car.id),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'ကားပေါ်ရှိပစ္စည်းများ',
                  ),
                ),
                Flexible(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(CustomIcons.printer),
                    label: const Text('PRINT',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          _getItemsOnCar(context),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _getItemsOnCar(context) {
    void updateItemsArrived(List<ItemOnCar> items) {
      // GET DRIVER ID
      int driverId = Provider.of<CargoItemManager>(context, listen: false)
              .carDriverMap[car.id] ??
          1;

      for (ItemOnCar item in items) {
        Provider.of<AppDb>(context, listen: false)
            .transportingItemsDao
            .updateTransportingItems(
              item.transportingItem.copyWith(
                isArrived: true,
                driverId: d.Value(driverId),
              ),
            );
      }
    }

    return StreamBuilder(
      stream: Provider.of<AppDb>(context, listen: false)
          .transportingItemsDao
          .watchItemsOnCar(car.id),
      builder: (context, AsyncSnapshot<List<ItemOnCar>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<ItemOnCar> items = snapshot.data ?? [];
          if (items.isNotEmpty) {
            return Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                  itemBuilder: (context, index) {
                    return ItemsOnCarTile(
                      itemWithInfo: ItemWithCustomerInvoice(
                        customerInvoice: items[index].customerInvoice,
                        customerItem: items[index].customerItem,
                      ),
                      transportingItem: items[index].transportingItem,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('အတည်ပြုရန်'),
                            content:
                                const Text('ပစ္စည်းအားလုံးရောက်ရှိသွားပါပြီ။'),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('မလုပ်ပါ'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                onPressed: () {
                                  updateItemsArrived(items);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('သေချာပါသည်'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CustomIcons.truck_delivery),
                          SizedBox(width: 20.0),
                          Text(
                            'ပစ္စည်းအားလုံးပို့ဆောင်ပြီး။',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('ကားပေါ်တွင် ပို့ဆောင်စရာ ပစ္စည်းမရှိပါ။'),
            );
          }
        } else {
          return const SizedBox(
            height: 30.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class ItemsOnCarTile extends StatelessWidget {
  const ItemsOnCarTile(
      {super.key, required this.itemWithInfo, required this.transportingItem});

  final ItemWithCustomerInvoice itemWithInfo;
  final TransportingItem transportingItem;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // REMOVE ITEM FROM CAR AND GET BACK INTO WAITING AREA
              Provider.of<AppDb>(context, listen: false)
                  .customerItemsDao
                  .updateCustomerItem(
                      itemWithInfo.customerItem.copyWith(isOnCar: false));

              // REMOVE FROM TRANSPORTING ITEM TABLE
              Provider.of<AppDb>(context, listen: false)
                  .transportingItemsDao
                  .deleteTransportingItems(transportingItem);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'ကားပေါ်မှ ပြန်ချရန်',
          ),
        ],
      ),
      child: TransportItemTile(itemWithInfo: itemWithInfo),
    );
  }
}

class DriverDropdown extends StatelessWidget {
  const DriverDropdown({super.key, required this.carId});
  final int carId;

  @override
  Widget build(BuildContext context) {
    CargoItemManager cargoItemMgr = Provider.of<CargoItemManager>(context);

    return FutureBuilder(
      future: Provider.of<AppDb>(context, listen: false)
          .driversDao
          .getPresentDrivers(),
      builder: (context, AsyncSnapshot<List<Driver>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<Driver> drivers = snapshot.data ?? [];

          if (drivers.isEmpty) {
            return const Text('ရွေးချယ်စရာ ကားဆရာ မရှိပါ။');
          } else {
            List<DropdownMenuItem<int>> dropdownItems =
                drivers.map((Driver driver) {
              return DropdownMenuItem(
                value: driver.id,
                child: Text(driver.driverName),
              );
            }).toList();

            // CHECK PREVIOUS DRIVER ID
            // TWO CONDITIONS
            // - has previous check true, false
            // - Current driver selection contain or not
            bool hasPreviousDriverChoice =
                cargoItemMgr.carDriverMap.containsKey(carId);

            List<int> presentDriversIdList =
                drivers.map((Driver d) => d.id).toList();

            int driverId;
            if (hasPreviousDriverChoice) {
              driverId = cargoItemMgr.carDriverMap[carId]!;
              if (!presentDriversIdList.contains(driverId)) {
                driverId = presentDriversIdList.first;
              }
            } else {
              driverId = presentDriversIdList.first;
            }
            // END CHECK PREVIOUS DRIVER ID

            return DropdownButton<int>(
              value: driverId,
              items: dropdownItems,
              onChanged: (value) {
                cargoItemMgr.setCarDriverPair(carId, value!);
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
