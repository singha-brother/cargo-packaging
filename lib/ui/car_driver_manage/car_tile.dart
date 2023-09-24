import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import './car_input_form.dart';

class CarTile extends StatelessWidget {
  const CarTile({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Checkbox(
              value: car.isPresent,
              onChanged: (value) {
                Provider.of<AppDb>(context, listen: false)
                    .carsDao
                    .updateCar(car.copyWith(isPresent: value));

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${car.carNumber}\'s state changed.'),
                    backgroundColor: Colors.blue,
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.carNumber,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight:
                        car.isPresent ? FontWeight.w500 : FontWeight.w300,
                    decoration: car.isPresent
                        ? TextDecoration.none
                        : TextDecoration.lineThrough,
                    color: car.isPresent ? Colors.black : Colors.grey,
                  ),
                ),
                Text(car.ownerName)
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarInputForm(
                          originalCar: car,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit_document)))
        ],
      ),
    );
  }
}
