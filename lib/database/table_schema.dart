import 'package:drift/drift.dart';

class CustomerInvoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get customerName => text()();
  TextColumn get receiverName => text()();
  TextColumn get fromLocation => text()();
  TextColumn get toLocation => text()();
  IntColumn get totalPrice => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get fromTownship => text()();
  TextColumn get toTownship => text()();
  TextColumn get customerPhone => text().nullable()();
  TextColumn get receiverPhone => text().nullable()();
  BoolColumn get isCheckOut => boolean().withDefault(const Constant(true))();
}

class CustomerItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerInvoiceId =>
      integer().references(CustomerInvoices, #id)();
  TextColumn get itemName => text()();
  IntColumn get quantity => integer()();
  IntColumn get price => integer()();
  BoolColumn get isOnCar => boolean().withDefault(const Constant(false))();
}

class Cars extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get carNumber => text()();
  TextColumn get ownerName => text()();
  BoolColumn get isPresent => boolean().withDefault(const Constant(true))();
}

class Drivers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get driverName => text()();
  BoolColumn get isPresent => boolean().withDefault(const Constant(true))();
}

class TransportingItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().references(CustomerItems, #id)();
  IntColumn get carId => integer().references(Cars, #id)();
  IntColumn get driverId => integer().references(Drivers, #id).nullable()();
  DateTimeColumn get transportDate => dateTime()();
  BoolColumn get isArrived => boolean().withDefault(const Constant(false))();
}

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get driverId => integer().references(Drivers, #id)();
  IntColumn get carId => integer().references(Cars, #id)();
  TextColumn get description => text().nullable()();
  IntColumn get amount => integer()();
  DateTimeColumn get date => dateTime()();
}
