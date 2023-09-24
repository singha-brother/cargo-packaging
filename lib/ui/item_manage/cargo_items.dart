import 'package:flutter/material.dart';

import 'components/available_car_list.dart';
import 'components/control_button.dart';
import 'components/transport_item_list.dart';

class CargoItemsScreen extends StatelessWidget {
  const CargoItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvailableCarsList(),
        SizedBox(height: 20.0),
        ControlButtons(),
        SizedBox(height: 20.0),
        Expanded(
          child: TransportItemsList(),
        ),
      ],
    );
  }
}
