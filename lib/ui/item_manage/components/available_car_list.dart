import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../database/db.dart';
import 'available_car_tile.dart';

class AvailableCarsList extends StatelessWidget {
  const AvailableCarsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<AppDb>(context, listen: false).carsDao.getPresentCars(),
      builder: (context, AsyncSnapshot<List<Car>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<Car> cars = snapshot.data ?? [];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return AvailableCarTile(car: cars[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20.0);
                },
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
