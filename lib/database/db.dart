import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import './query_models.dart';
import './table_schema.dart';

part 'db.g.dart';

@DriftDatabase(tables: [
  CustomerInvoices,
  CustomerItems,
  Cars,
  Drivers,
  TransportingItems,
  Expenses
], daos: [
  CustomerInvoicesDao,
  CustomerItemsDao,
  CarsDao,
  DriversDao,
  TransportingItemsDao,
  ExpensesDao,
])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cargo_items.sqlite'));
    print(file);
    return NativeDatabase.createBackgroundConnection(file, logStatements: true);
  });
}

@DriftAccessor(tables: [CustomerItems])
class CustomerItemsDao extends DatabaseAccessor<AppDb>
    with _$CustomerItemsDaoMixin {
  CustomerItemsDao(AppDb db) : super(db);

  Future<List<CustomerItem>> getCustomerItems() {
    return select(customerItems).get();
  }

  Future<int> insertCustomerItem(Insertable<CustomerItem> customerItem) =>
      into(customerItems).insert(customerItem);

  Future updateCustomerItem(Insertable<CustomerItem> customerItem) =>
      update(customerItems).replace(customerItem);

  Future<CustomerItem> getItemWithId(int id) {
    return (select(customerItems)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // Number of items not on car
  // FOR Report
  Future<int> getNumberOfItemsNotOnCar() async {
    var items = await (select(customerItems)
          ..where((tbl) => tbl.isOnCar.equals(false)))
        .get();
    return items.length;
  }

  // FOR INVOICE DETAIL
  // Get all items filtered by customer invoice id
  Future<List<CustomerItem>> getItemsWithInvoice(int invoiceId) {
    return (select(customerItems)
          ..where((tbl) => tbl.customerInvoiceId.equals(invoiceId)))
        .get();
  }

  // FOR ITEM_MANAGE
  // Get Item with customer info , which are not on car
  Stream<List<ItemWithCustomerInvoice>> watchItemsWithCustomerInvoice() {
    final query = select(customerInvoices).join([
      innerJoin(customerItems,
          customerItems.customerInvoiceId.equalsExp(customerInvoices.id))
    ])
      ..where(customerItems.isOnCar.equals(false));
    return query.map((row) {
      return ItemWithCustomerInvoice(
          customerItem: row.readTable(customerItems),
          customerInvoice: row.readTable(customerInvoices));
    }).watch();
  }
}

@DriftAccessor(tables: [CustomerInvoices])
class CustomerInvoicesDao extends DatabaseAccessor<AppDb>
    with _$CustomerInvoicesDaoMixin {
  CustomerInvoicesDao(AppDb db) : super(db);

  // insert customer invoices
  Future<int> insertCustomerInvoice(
          Insertable<CustomerInvoice> customerInvoice) =>
      into(customerInvoices).insert(customerInvoice);

  // Get customer invoice
  Future<List<CustomerInvoice>> getCustomerInvoices() {
    return (select(customerInvoices)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)]))
        .get();
  }

  // Total number of invoices
  // for report
  Future<int> getNumberOfInvoices() async {
    var invoices = await select(customerInvoices).get();
    return invoices.length;
  }

  // Get customer invoice , selected by date
  Future<List<CustomerInvoice>> getCustomerInvoicesByDate(
      DateTime selectedDate) {
    return (select(customerInvoices)
          ..where((row) {
            final date = row.date;
            return date.year.equals(selectedDate.year) &
                date.month.equals(selectedDate.month) &
                date.day.equals(selectedDate.day);
          }))
        .get();
  }
}

@DriftAccessor(tables: [Cars])
class CarsDao extends DatabaseAccessor<AppDb> with _$CarsDaoMixin {
  CarsDao(AppDb db) : super(db);

  Future insertCar(Insertable<Car> car) => into(cars).insert(car);

  Stream<List<Car>> getAllCars() {
    return (select(cars)
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.isPresent),
            (tbl) => OrderingTerm.asc(tbl.carNumber),
            (tbl) => OrderingTerm.desc(tbl.id),
          ]))
        .watch();
  }

  Future updateCar(Insertable<Car> car) => update(cars).replace(car);

  Future<List<Car>> getPresentCars() {
    return (select(cars)..where((tbl) => tbl.isPresent)).get();
  }

  // Get Car Number from CarID
  Future<String> getCarNumber(int carId) async {
    Car car =
        await (select(cars)..where((tbl) => tbl.id.equals(carId))).getSingle();
    return car.carNumber;
  }
}

@DriftAccessor(tables: [Drivers])
class DriversDao extends DatabaseAccessor<AppDb> with _$DriversDaoMixin {
  DriversDao(AppDb db) : super(db);

  Future insertDriver(Insertable<Driver> driver) =>
      into(drivers).insert(driver);

  Stream<List<Driver>> watchAllDrivers() {
    return (select(drivers)
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.isPresent),
            (tbl) => OrderingTerm.desc(tbl.driverName),
          ]))
        .watch();
  }

  Future updateDriver(Insertable<Driver> driver) =>
      update(drivers).replace(driver);

  Future<List<Driver>> getPresentDrivers() {
    return (select(drivers)..where((tbl) => tbl.isPresent)).get();
  }
}

@DriftAccessor(tables: [TransportingItems])
class TransportingItemsDao extends DatabaseAccessor<AppDb>
    with _$TransportingItemsDaoMixin {
  TransportingItemsDao(AppDb db) : super(db);

  Future<int> insertTransportingItems(
          Insertable<TransportingItem> transportingItem) =>
      into(transportingItems).insert(transportingItem);

  Future updateTransportingItems(
          Insertable<TransportingItem> transportingItem) =>
      update(transportingItems).replace(transportingItem);

  Future deleteTransportingItems(
          Insertable<TransportingItem> transportingItem) =>
      delete(transportingItems).delete(transportingItem);

  // FOR REPORT
  // Number of items left to transport
  Future<int> getNumberOfItemsToTransport() async {
    var items = await (select(transportingItems)
          ..where((tbl) => tbl.isArrived.equals(false)))
        .get();
    return items.length;
  }

  // Number of items has transported
  Future<int> getNumberOfItemsTransported() async {
    var items = await (select(transportingItems)
          ..where((tbl) => tbl.isArrived.equals(true)))
        .get();
    return items.length;
  }

  // ITEMS ON CAR
  // ============
  Stream<List<ItemOnCar>> watchItemsOnCar(int carId) {
    final query = select(transportingItems).join([
      leftOuterJoin(
        customerItems,
        transportingItems.itemId.equalsExp(customerItems.id),
      ),
      leftOuterJoin(customerInvoices,
          customerItems.customerInvoiceId.equalsExp(customerInvoices.id)),
      leftOuterJoin(cars, transportingItems.carId.equalsExp(cars.id)),
    ])
      ..where(transportingItems.isArrived.equals(false))
      ..where(cars.id.equals(carId));

    return query.map((result) {
      return ItemOnCar(
        customerItem: result.readTable(customerItems),
        customerInvoice: result.readTable(customerInvoices),
        transportingItem: result.readTable(transportingItems),
      );
    }).watch();
  }

  // FOR INVOICE DETAIL - ITEM CONDITION
  // get all items filtered by customer invoice id and
  // check the items' condition
  Future<List<ItemCondition>> getItemConditionByInvoiceId(int invoiceId) {
    final query = (select(customerItems)
          ..where(
            (tbl) => tbl.customerInvoiceId.equals(invoiceId),
          ))
        .join([
      leftOuterJoin(transportingItems,
          customerItems.id.equalsExp(transportingItems.itemId)),
      leftOuterJoin(cars, transportingItems.carId.equalsExp(cars.id)),
      leftOuterJoin(drivers, transportingItems.driverId.equalsExp(drivers.id)),
    ]);

    return query.map(
      (result) {
        return ItemCondition(
          customerItem: result.readTable(customerItems),
          transportingItem: result.readTableOrNull(transportingItems),
          car: result.readTableOrNull(cars),
          driver: result.readTableOrNull(drivers),
        );
      },
    ).get();
  }

  // ITEM ON CAR (JUST COUNT)
  Stream<List<TransportingItem>> getNumOfItemsOnCar(int carId) {
    return (select(transportingItems)
          ..where(
            (tbl) => tbl.isArrived.equals(false),
          )
          ..where(
            (tbl) => tbl.carId.equals(carId),
          ))
        .watch();
  }
}

@DriftAccessor(tables: [Expenses])
class ExpensesDao extends DatabaseAccessor<AppDb> with _$ExpensesDaoMixin {
  ExpensesDao(AppDb db) : super(db);

  Future<int> insertExpense(Insertable<Expense> expense) =>
      into(expenses).insert(expense);

  Future updateExpense(Insertable<Expense> expense) =>
      update(expenses).replace(expense);

  Future deleteExpense(Insertable<Expense> expense) =>
      delete(expenses).delete(expense);

  // final query = select(customerInvoices).join([
  //   innerJoin(customerItems,
  //       customerItems.customerInvoiceId.equalsExp(customerInvoices.id))
  // ])
  //   ..where(customerItems.isOnCar.equals(false));
  // return query.map((row) {
  //   return ItemWithCustomerInvoice(
  //       customerItem: row.readTable(customerItems),
  //       customerInvoice: row.readTable(customerInvoices));
  // }).watch();
  Stream<List<ExpenseWithDriverCar>> watchAllExpenses() {
    var query =
        (select(expenses)..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])).join([
      leftOuterJoin(drivers, expenses.driverId.equalsExp(drivers.id)),
      leftOuterJoin(cars, expenses.carId.equalsExp(cars.id))
    ]);

    return query.map((result) {
      return ExpenseWithDriverCar(
          expense: result.readTable(expenses),
          car: result.readTable(cars),
          driver: result.readTable(drivers));
    }).watch();
  }
}
