import 'package:flutter/material.dart';

class Item {
  String name;
  int price;
  int quantity;

  Item({required this.name, required this.price, required this.quantity});
}

class ItemManager extends ChangeNotifier {
  final List<Item> _items = <Item>[];

  List<Item> get getItems => _items;

  void addNewItem({
    required String name,
    required int price,
    required int quantity,
  }) {
    Item newItem = Item(name: name, price: price, quantity: quantity);
    _items.add(newItem);
    notifyListeners();
  }

  void removeItem(int idx) {
    _items.removeAt(idx);
    notifyListeners();
  }

  void removeAllItems() {
    _items.clear();
    notifyListeners();
  }

  int getGrandTotal() {
    return _items.fold(0, (prev, item) => prev + (item.price * item.quantity));
  }
}
