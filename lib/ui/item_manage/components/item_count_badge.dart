import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../../database/db.dart';
import '../../widgets/my_flutter_app_icons.dart';

class ItemCountBadge extends StatelessWidget {
  const ItemCountBadge({
    super.key,
    required this.highlighted,
    required this.carId,
  });

  final bool highlighted;
  final int carId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AppDb>(context, listen: false)
          .transportingItemsDao
          .getNumOfItemsOnCar(carId),
      builder: (context, AsyncSnapshot<List<TransportingItem>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<TransportingItem> items = snapshot.data ?? [];
          int itemCount = items.length;
          return badges.Badge(
            position: badges.BadgePosition.topStart(top: -25, start: -25),
            badgeContent: Text(
              itemCount.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            badgeAnimation: const badges.BadgeAnimation.scale(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            child: Icon(
              CustomIcons.truck_fast,
              color:
                  highlighted ? Colors.white : Theme.of(context).primaryColor,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
