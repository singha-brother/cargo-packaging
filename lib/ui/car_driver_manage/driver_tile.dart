import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import './driver_input_form.dart';

class DriverTile extends StatelessWidget {
  const DriverTile({super.key, required this.driver});

  final Driver driver;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Checkbox(
              value: driver.isPresent,
              onChanged: (value) {
                Provider.of<AppDb>(context, listen: false)
                    .driversDao
                    .updateDriver(driver.copyWith(isPresent: value));

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${driver.driverName} changed.'),
                    backgroundColor: Colors.blue,
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              driver.driverName,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight:
                      driver.isPresent ? FontWeight.w500 : FontWeight.w300,
                  decoration: driver.isPresent
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                  color: driver.isPresent ? Colors.black : Colors.grey),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverInputForm(driver: driver),
                        ));
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (context) {
                    //     return SingleChildScrollView(
                    //       child: DriverEditForm(
                    //         driver: driver,
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  icon: const Icon(Icons.edit_document)))
        ],
      ),
    );
  }
}
