import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import './car_tile.dart';

class CarsListView extends StatelessWidget {
  const CarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AppDb>(context).carsDao.getAllCars(),
      builder: (context, AsyncSnapshot<List<Car>> snapshot) {
        final cars = snapshot.data ?? [];

        return ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            return CarTile(car: cars[index]);
          },
        );
      },
    );
  }
}
