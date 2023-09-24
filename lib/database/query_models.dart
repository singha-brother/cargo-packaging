import 'package:cargo_packaging/database/db.dart';

class ItemWithCustomerInvoice {
  CustomerItem customerItem;
  CustomerInvoice customerInvoice;

  ItemWithCustomerInvoice({
    required this.customerItem,
    required this.customerInvoice,
  });
}

class ItemOnCar {
  CustomerItem customerItem;
  CustomerInvoice customerInvoice;
  TransportingItem transportingItem;

  ItemOnCar({
    required this.customerItem,
    required this.customerInvoice,
    required this.transportingItem,
  });
}

class ItemCondition {
  CustomerItem customerItem;
  TransportingItem? transportingItem;
  Car? car;
  Driver? driver;

  ItemCondition({
    required this.customerItem,
    this.transportingItem,
    this.car,
    this.driver,
  });
}

class ExpenseWithDriverCar {
  Expense expense;
  Car car;
  Driver driver;

  ExpenseWithDriverCar({
    required this.expense,
    required this.car,
    required this.driver,
  });
}
