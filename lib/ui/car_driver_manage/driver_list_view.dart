import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../database/db.dart';
import './driver_tile.dart';

class DriversListView extends StatelessWidget {
  const DriversListView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AppDb>(context).driversDao.watchAllDrivers(),
      builder: (context, AsyncSnapshot<List<Driver>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final drivers = snapshot.data ?? [];

          return ListView.builder(
            itemCount: drivers.length,
            itemBuilder: (context, index) {
              return DriverTile(driver: drivers[index]);
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

      // builder: (context, AsyncSnapshot<List<Driver>> snapshot) {
      //   if (snapshot.hasData && snapshot.data != null) {
      //     final drivers = snapshot.data ?? [];
      //     final GlobalKey<AnimatedListState> _listKey = GlobalKey();

          
      //     return ListView.builder(
      //       itemCount: drivers.length,
      //       itemBuilder: (context, index) {
      //         return DriverTile(driver: drivers[index]);
      //       },
      //     );
      //   } else {
      //     return CircularProgressIndicator();
      //   }
      // },