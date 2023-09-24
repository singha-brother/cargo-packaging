import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/db.dart';
import '../widgets/custom_intput_field.dart';
import '../../utils/form_text_validation.dart';

class CarInputForm extends StatelessWidget {
  const CarInputForm({super.key, this.originalCar})
      : isUpdating = (originalCar != null);

  final Car? originalCar;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    String carNumber = '';
    String ownerName = '';
    if (isUpdating) {
      carNumber = originalCar!.carNumber;
      ownerName = originalCar!.ownerName;
    }
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdating ? 'ပြင်ဆင်ရန်' : 'အသစ်ထည့်ရန်'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              CustomInputField(
                labelText: 'Car Number',
                validator: textValidation('Car Number'),
                onChange: (newValue) {
                  carNumber = newValue;
                },
                autoFocus: true,
                initialValue: carNumber,
              ),
              const SizedBox(height: 10.0),
              CustomInputField(
                labelText: 'Owner Name',
                validator: textValidation('Owner Name'),
                onChange: (newValue) {
                  ownerName = newValue;
                },
                initialValue: ownerName,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (isUpdating) {
                      Provider.of<AppDb>(context, listen: false)
                          .carsDao
                          .updateCar(originalCar!.copyWith(
                            carNumber: carNumber,
                            ownerName: ownerName,
                          ));
                    } else {
                      final CarsCompanion car = CarsCompanion(
                        carNumber: d.Value(carNumber),
                        ownerName: d.Value(ownerName),
                      );
                      Provider.of<AppDb>(context, listen: false)
                          .carsDao
                          .insertCar(car);
                    }
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: 4.0,
                  padding: const EdgeInsets.all(15.0),
                ),
                child: Text(isUpdating ? 'ပြင်ဆင်ရန်' : 'အသစ်ထည့်ရန်'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
