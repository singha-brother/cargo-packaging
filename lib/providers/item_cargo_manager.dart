import 'package:flutter/material.dart';

class CargoItemManager extends ChangeNotifier {
  int selectedIdx = -1;
  bool isSelecting = false;
  // CarId DriverId Mapping
  Map<int, int> carDriverMap = {};

  List<int> selectedItems = [];

  void addItem(int id) {
    selectedItems.add(id);
    notifyListeners();
  }

  void removeItem(int id) {
    selectedItems.remove(id);
    notifyListeners();
  }

  void removeAllItems() {
    selectedItems = [];
  }

  void selectCar(int idx) {
    selectedIdx = idx;
    isSelecting = true;
    notifyListeners();
  }

  void cancelSelect() {
    selectedIdx = -1;
    isSelecting = false;
    notifyListeners();
  }

  void setCarDriverPair(int carId, int driverId) {
    carDriverMap[carId] = driverId;
    notifyListeners();
  }
}
