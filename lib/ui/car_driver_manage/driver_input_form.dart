import '../../database/db.dart';
import '../widgets/custom_intput_field.dart';
import '../../utils/form_text_validation.dart';

import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriverInputForm extends StatelessWidget {
  const DriverInputForm({
    super.key,
    this.driver,
  }) : isUpdating = (driver != null);

  final Driver? driver;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String driverName = '';

    if (driver != null) {
      driverName = driver!.driverName;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('add driver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: CustomInputField(
                  labelText: 'Driver Name',
                  validator: textValidation('Driver Name'),
                  onChange: (newValue) {
                    driverName = newValue;
                  },
                  autoFocus: true,
                  initialValue: driverName,
                ),
              ),
              const SizedBox(width: 20.0),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (driver != null) {
                        Provider.of<AppDb>(context, listen: false)
                            .driversDao
                            .updateDriver(
                              driver!.copyWith(
                                driverName: driverName,
                              ),
                            );
                      } else {
                        Provider.of<AppDb>(context, listen: false)
                            .driversDao
                            .insertDriver(
                              DriversCompanion(
                                driverName: d.Value(driverName),
                              ),
                            );
                      }

                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 4.0,
                    padding: const EdgeInsets.all(20.0),
                  ),
                  child: const Text('ADD'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
