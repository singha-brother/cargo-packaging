import 'package:flutter/material.dart';

class CustomerInfoManager extends ChangeNotifier {
  String name = '';
  String fromLocation = '';
  String fromTownship = 'Monywa';
  String customerPhone = '';

  String receiverName = '';
  String toLocation = '';
  String toTownship = 'Mandalay';
  String receiverPhone = '';

  bool isCheckOut = true;

  void resetCustomerInfo() {
    name = '';
    fromLocation = '';
    customerPhone = '';
    receiverName = '';
    toLocation = '';
    receiverPhone = '';
    isCheckOut = true;
  }

  void changeName(newName) {
    name = newName;
  }

  void changeReceiverName(newName) {
    receiverName = newName;
  }

  void changeFromLocation(newLoc) {
    fromLocation = newLoc;
  }

  void changeToLocation(newLoc) {
    toLocation = newLoc;
  }

  void changeFromTownship(newLoc) {
    fromTownship = newLoc;
    notifyListeners();
  }

  void changeToTownship(newLoc) {
    toTownship = newLoc;
    notifyListeners();
  }

  void changeCustomerPhone(newValue) {
    customerPhone = newValue;
  }

  void changeReceiverPhone(newValue) {
    receiverPhone = newValue;
  }

  void changeIsCheckOut(newValue) {
    isCheckOut = newValue;
    notifyListeners();
  }
}
