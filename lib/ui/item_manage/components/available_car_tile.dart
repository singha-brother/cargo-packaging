import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../database/db.dart';
import '../../../providers/item_cargo_manager.dart';
import '../manage_items_on_car.dart';
import 'item_count_badge.dart';

class AvailableCarTile extends StatelessWidget {
  const AvailableCarTile({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    bool highlighted =
        Provider.of<CargoItemManager>(context).selectedIdx == car.id;

    return Transform.scale(
      scale: highlighted ? 1.095 : 1.0,
      child: GestureDetector(
        onTap: () {
          // GO TO EACH CAR PAGE
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ManageItemsOnCarScreen(
                car: car,
              ),
            ),
          );
        },
        onLongPress: () {
          Provider.of<CargoItemManager>(context, listen: false)
              .selectCar(car.id);
        },
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          surfaceTintColor:
              highlighted ? Theme.of(context).primaryColor : Colors.white,
          color: highlighted ? Theme.of(context).primaryColor : Colors.white,
          elevation: 4.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemCountBadge(highlighted: highlighted, carId: car.id),
                const SizedBox(width: 10.0),
                Text(
                  car.carNumber,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: highlighted
                          ? Colors.white
                          : Theme.of(context).primaryColor),
                ),

                // TextItemCount(highlighted: highlighted, carId: car.id),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
