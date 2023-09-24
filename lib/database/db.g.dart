// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $CustomerInvoicesTable extends CustomerInvoices
    with TableInfo<$CustomerInvoicesTable, CustomerInvoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerInvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _receiverNameMeta =
      const VerificationMeta('receiverName');
  @override
  late final GeneratedColumn<String> receiverName = GeneratedColumn<String>(
      'receiver_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fromLocationMeta =
      const VerificationMeta('fromLocation');
  @override
  late final GeneratedColumn<String> fromLocation = GeneratedColumn<String>(
      'from_location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _toLocationMeta =
      const VerificationMeta('toLocation');
  @override
  late final GeneratedColumn<String> toLocation = GeneratedColumn<String>(
      'to_location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<int> totalPrice = GeneratedColumn<int>(
      'total_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fromTownshipMeta =
      const VerificationMeta('fromTownship');
  @override
  late final GeneratedColumn<String> fromTownship = GeneratedColumn<String>(
      'from_township', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _toTownshipMeta =
      const VerificationMeta('toTownship');
  @override
  late final GeneratedColumn<String> toTownship = GeneratedColumn<String>(
      'to_township', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerPhoneMeta =
      const VerificationMeta('customerPhone');
  @override
  late final GeneratedColumn<String> customerPhone = GeneratedColumn<String>(
      'customer_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiverPhoneMeta =
      const VerificationMeta('receiverPhone');
  @override
  late final GeneratedColumn<String> receiverPhone = GeneratedColumn<String>(
      'receiver_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCheckOutMeta =
      const VerificationMeta('isCheckOut');
  @override
  late final GeneratedColumn<bool> isCheckOut =
      GeneratedColumn<bool>('is_check_out', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_check_out" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        customerName,
        receiverName,
        fromLocation,
        toLocation,
        totalPrice,
        date,
        fromTownship,
        toTownship,
        customerPhone,
        receiverPhone,
        isCheckOut
      ];
  @override
  String get aliasedName => _alias ?? 'customer_invoices';
  @override
  String get actualTableName => 'customer_invoices';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerInvoice> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('receiver_name')) {
      context.handle(
          _receiverNameMeta,
          receiverName.isAcceptableOrUnknown(
              data['receiver_name']!, _receiverNameMeta));
    } else if (isInserting) {
      context.missing(_receiverNameMeta);
    }
    if (data.containsKey('from_location')) {
      context.handle(
          _fromLocationMeta,
          fromLocation.isAcceptableOrUnknown(
              data['from_location']!, _fromLocationMeta));
    } else if (isInserting) {
      context.missing(_fromLocationMeta);
    }
    if (data.containsKey('to_location')) {
      context.handle(
          _toLocationMeta,
          toLocation.isAcceptableOrUnknown(
              data['to_location']!, _toLocationMeta));
    } else if (isInserting) {
      context.missing(_toLocationMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('from_township')) {
      context.handle(
          _fromTownshipMeta,
          fromTownship.isAcceptableOrUnknown(
              data['from_township']!, _fromTownshipMeta));
    } else if (isInserting) {
      context.missing(_fromTownshipMeta);
    }
    if (data.containsKey('to_township')) {
      context.handle(
          _toTownshipMeta,
          toTownship.isAcceptableOrUnknown(
              data['to_township']!, _toTownshipMeta));
    } else if (isInserting) {
      context.missing(_toTownshipMeta);
    }
    if (data.containsKey('customer_phone')) {
      context.handle(
          _customerPhoneMeta,
          customerPhone.isAcceptableOrUnknown(
              data['customer_phone']!, _customerPhoneMeta));
    }
    if (data.containsKey('receiver_phone')) {
      context.handle(
          _receiverPhoneMeta,
          receiverPhone.isAcceptableOrUnknown(
              data['receiver_phone']!, _receiverPhoneMeta));
    }
    if (data.containsKey('is_check_out')) {
      context.handle(
          _isCheckOutMeta,
          isCheckOut.isAcceptableOrUnknown(
              data['is_check_out']!, _isCheckOutMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerInvoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerInvoice(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      receiverName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receiver_name'])!,
      fromLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}from_location'])!,
      toLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to_location'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_price'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      fromTownship: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}from_township'])!,
      toTownship: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}to_township'])!,
      customerPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_phone']),
      receiverPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receiver_phone']),
      isCheckOut: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_check_out'])!,
    );
  }

  @override
  $CustomerInvoicesTable createAlias(String alias) {
    return $CustomerInvoicesTable(attachedDatabase, alias);
  }
}

class CustomerInvoice extends DataClass implements Insertable<CustomerInvoice> {
  final int id;
  final String customerName;
  final String receiverName;
  final String fromLocation;
  final String toLocation;
  final int totalPrice;
  final DateTime date;
  final String fromTownship;
  final String toTownship;
  final String? customerPhone;
  final String? receiverPhone;
  final bool isCheckOut;
  const CustomerInvoice(
      {required this.id,
      required this.customerName,
      required this.receiverName,
      required this.fromLocation,
      required this.toLocation,
      required this.totalPrice,
      required this.date,
      required this.fromTownship,
      required this.toTownship,
      this.customerPhone,
      this.receiverPhone,
      required this.isCheckOut});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_name'] = Variable<String>(customerName);
    map['receiver_name'] = Variable<String>(receiverName);
    map['from_location'] = Variable<String>(fromLocation);
    map['to_location'] = Variable<String>(toLocation);
    map['total_price'] = Variable<int>(totalPrice);
    map['date'] = Variable<DateTime>(date);
    map['from_township'] = Variable<String>(fromTownship);
    map['to_township'] = Variable<String>(toTownship);
    if (!nullToAbsent || customerPhone != null) {
      map['customer_phone'] = Variable<String>(customerPhone);
    }
    if (!nullToAbsent || receiverPhone != null) {
      map['receiver_phone'] = Variable<String>(receiverPhone);
    }
    map['is_check_out'] = Variable<bool>(isCheckOut);
    return map;
  }

  CustomerInvoicesCompanion toCompanion(bool nullToAbsent) {
    return CustomerInvoicesCompanion(
      id: Value(id),
      customerName: Value(customerName),
      receiverName: Value(receiverName),
      fromLocation: Value(fromLocation),
      toLocation: Value(toLocation),
      totalPrice: Value(totalPrice),
      date: Value(date),
      fromTownship: Value(fromTownship),
      toTownship: Value(toTownship),
      customerPhone: customerPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(customerPhone),
      receiverPhone: receiverPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(receiverPhone),
      isCheckOut: Value(isCheckOut),
    );
  }

  factory CustomerInvoice.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerInvoice(
      id: serializer.fromJson<int>(json['id']),
      customerName: serializer.fromJson<String>(json['customerName']),
      receiverName: serializer.fromJson<String>(json['receiverName']),
      fromLocation: serializer.fromJson<String>(json['fromLocation']),
      toLocation: serializer.fromJson<String>(json['toLocation']),
      totalPrice: serializer.fromJson<int>(json['totalPrice']),
      date: serializer.fromJson<DateTime>(json['date']),
      fromTownship: serializer.fromJson<String>(json['fromTownship']),
      toTownship: serializer.fromJson<String>(json['toTownship']),
      customerPhone: serializer.fromJson<String?>(json['customerPhone']),
      receiverPhone: serializer.fromJson<String?>(json['receiverPhone']),
      isCheckOut: serializer.fromJson<bool>(json['isCheckOut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerName': serializer.toJson<String>(customerName),
      'receiverName': serializer.toJson<String>(receiverName),
      'fromLocation': serializer.toJson<String>(fromLocation),
      'toLocation': serializer.toJson<String>(toLocation),
      'totalPrice': serializer.toJson<int>(totalPrice),
      'date': serializer.toJson<DateTime>(date),
      'fromTownship': serializer.toJson<String>(fromTownship),
      'toTownship': serializer.toJson<String>(toTownship),
      'customerPhone': serializer.toJson<String?>(customerPhone),
      'receiverPhone': serializer.toJson<String?>(receiverPhone),
      'isCheckOut': serializer.toJson<bool>(isCheckOut),
    };
  }

  CustomerInvoice copyWith(
          {int? id,
          String? customerName,
          String? receiverName,
          String? fromLocation,
          String? toLocation,
          int? totalPrice,
          DateTime? date,
          String? fromTownship,
          String? toTownship,
          Value<String?> customerPhone = const Value.absent(),
          Value<String?> receiverPhone = const Value.absent(),
          bool? isCheckOut}) =>
      CustomerInvoice(
        id: id ?? this.id,
        customerName: customerName ?? this.customerName,
        receiverName: receiverName ?? this.receiverName,
        fromLocation: fromLocation ?? this.fromLocation,
        toLocation: toLocation ?? this.toLocation,
        totalPrice: totalPrice ?? this.totalPrice,
        date: date ?? this.date,
        fromTownship: fromTownship ?? this.fromTownship,
        toTownship: toTownship ?? this.toTownship,
        customerPhone:
            customerPhone.present ? customerPhone.value : this.customerPhone,
        receiverPhone:
            receiverPhone.present ? receiverPhone.value : this.receiverPhone,
        isCheckOut: isCheckOut ?? this.isCheckOut,
      );
  @override
  String toString() {
    return (StringBuffer('CustomerInvoice(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('receiverName: $receiverName, ')
          ..write('fromLocation: $fromLocation, ')
          ..write('toLocation: $toLocation, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('date: $date, ')
          ..write('fromTownship: $fromTownship, ')
          ..write('toTownship: $toTownship, ')
          ..write('customerPhone: $customerPhone, ')
          ..write('receiverPhone: $receiverPhone, ')
          ..write('isCheckOut: $isCheckOut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      customerName,
      receiverName,
      fromLocation,
      toLocation,
      totalPrice,
      date,
      fromTownship,
      toTownship,
      customerPhone,
      receiverPhone,
      isCheckOut);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerInvoice &&
          other.id == this.id &&
          other.customerName == this.customerName &&
          other.receiverName == this.receiverName &&
          other.fromLocation == this.fromLocation &&
          other.toLocation == this.toLocation &&
          other.totalPrice == this.totalPrice &&
          other.date == this.date &&
          other.fromTownship == this.fromTownship &&
          other.toTownship == this.toTownship &&
          other.customerPhone == this.customerPhone &&
          other.receiverPhone == this.receiverPhone &&
          other.isCheckOut == this.isCheckOut);
}

class CustomerInvoicesCompanion extends UpdateCompanion<CustomerInvoice> {
  final Value<int> id;
  final Value<String> customerName;
  final Value<String> receiverName;
  final Value<String> fromLocation;
  final Value<String> toLocation;
  final Value<int> totalPrice;
  final Value<DateTime> date;
  final Value<String> fromTownship;
  final Value<String> toTownship;
  final Value<String?> customerPhone;
  final Value<String?> receiverPhone;
  final Value<bool> isCheckOut;
  const CustomerInvoicesCompanion({
    this.id = const Value.absent(),
    this.customerName = const Value.absent(),
    this.receiverName = const Value.absent(),
    this.fromLocation = const Value.absent(),
    this.toLocation = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.date = const Value.absent(),
    this.fromTownship = const Value.absent(),
    this.toTownship = const Value.absent(),
    this.customerPhone = const Value.absent(),
    this.receiverPhone = const Value.absent(),
    this.isCheckOut = const Value.absent(),
  });
  CustomerInvoicesCompanion.insert({
    this.id = const Value.absent(),
    required String customerName,
    required String receiverName,
    required String fromLocation,
    required String toLocation,
    required int totalPrice,
    required DateTime date,
    required String fromTownship,
    required String toTownship,
    this.customerPhone = const Value.absent(),
    this.receiverPhone = const Value.absent(),
    this.isCheckOut = const Value.absent(),
  })  : customerName = Value(customerName),
        receiverName = Value(receiverName),
        fromLocation = Value(fromLocation),
        toLocation = Value(toLocation),
        totalPrice = Value(totalPrice),
        date = Value(date),
        fromTownship = Value(fromTownship),
        toTownship = Value(toTownship);
  static Insertable<CustomerInvoice> custom({
    Expression<int>? id,
    Expression<String>? customerName,
    Expression<String>? receiverName,
    Expression<String>? fromLocation,
    Expression<String>? toLocation,
    Expression<int>? totalPrice,
    Expression<DateTime>? date,
    Expression<String>? fromTownship,
    Expression<String>? toTownship,
    Expression<String>? customerPhone,
    Expression<String>? receiverPhone,
    Expression<bool>? isCheckOut,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerName != null) 'customer_name': customerName,
      if (receiverName != null) 'receiver_name': receiverName,
      if (fromLocation != null) 'from_location': fromLocation,
      if (toLocation != null) 'to_location': toLocation,
      if (totalPrice != null) 'total_price': totalPrice,
      if (date != null) 'date': date,
      if (fromTownship != null) 'from_township': fromTownship,
      if (toTownship != null) 'to_township': toTownship,
      if (customerPhone != null) 'customer_phone': customerPhone,
      if (receiverPhone != null) 'receiver_phone': receiverPhone,
      if (isCheckOut != null) 'is_check_out': isCheckOut,
    });
  }

  CustomerInvoicesCompanion copyWith(
      {Value<int>? id,
      Value<String>? customerName,
      Value<String>? receiverName,
      Value<String>? fromLocation,
      Value<String>? toLocation,
      Value<int>? totalPrice,
      Value<DateTime>? date,
      Value<String>? fromTownship,
      Value<String>? toTownship,
      Value<String?>? customerPhone,
      Value<String?>? receiverPhone,
      Value<bool>? isCheckOut}) {
    return CustomerInvoicesCompanion(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      receiverName: receiverName ?? this.receiverName,
      fromLocation: fromLocation ?? this.fromLocation,
      toLocation: toLocation ?? this.toLocation,
      totalPrice: totalPrice ?? this.totalPrice,
      date: date ?? this.date,
      fromTownship: fromTownship ?? this.fromTownship,
      toTownship: toTownship ?? this.toTownship,
      customerPhone: customerPhone ?? this.customerPhone,
      receiverPhone: receiverPhone ?? this.receiverPhone,
      isCheckOut: isCheckOut ?? this.isCheckOut,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (receiverName.present) {
      map['receiver_name'] = Variable<String>(receiverName.value);
    }
    if (fromLocation.present) {
      map['from_location'] = Variable<String>(fromLocation.value);
    }
    if (toLocation.present) {
      map['to_location'] = Variable<String>(toLocation.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<int>(totalPrice.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (fromTownship.present) {
      map['from_township'] = Variable<String>(fromTownship.value);
    }
    if (toTownship.present) {
      map['to_township'] = Variable<String>(toTownship.value);
    }
    if (customerPhone.present) {
      map['customer_phone'] = Variable<String>(customerPhone.value);
    }
    if (receiverPhone.present) {
      map['receiver_phone'] = Variable<String>(receiverPhone.value);
    }
    if (isCheckOut.present) {
      map['is_check_out'] = Variable<bool>(isCheckOut.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerInvoicesCompanion(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('receiverName: $receiverName, ')
          ..write('fromLocation: $fromLocation, ')
          ..write('toLocation: $toLocation, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('date: $date, ')
          ..write('fromTownship: $fromTownship, ')
          ..write('toTownship: $toTownship, ')
          ..write('customerPhone: $customerPhone, ')
          ..write('receiverPhone: $receiverPhone, ')
          ..write('isCheckOut: $isCheckOut')
          ..write(')'))
        .toString();
  }
}

class $CustomerItemsTable extends CustomerItems
    with TableInfo<$CustomerItemsTable, CustomerItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerInvoiceIdMeta =
      const VerificationMeta('customerInvoiceId');
  @override
  late final GeneratedColumn<int> customerInvoiceId = GeneratedColumn<int>(
      'customer_invoice_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES customer_invoices (id)'));
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isOnCarMeta =
      const VerificationMeta('isOnCar');
  @override
  late final GeneratedColumn<bool> isOnCar =
      GeneratedColumn<bool>('is_on_car', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_on_car" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, customerInvoiceId, itemName, quantity, price, isOnCar];
  @override
  String get aliasedName => _alias ?? 'customer_items';
  @override
  String get actualTableName => 'customer_items';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_invoice_id')) {
      context.handle(
          _customerInvoiceIdMeta,
          customerInvoiceId.isAcceptableOrUnknown(
              data['customer_invoice_id']!, _customerInvoiceIdMeta));
    } else if (isInserting) {
      context.missing(_customerInvoiceIdMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('is_on_car')) {
      context.handle(_isOnCarMeta,
          isOnCar.isAcceptableOrUnknown(data['is_on_car']!, _isOnCarMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerInvoiceId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}customer_invoice_id'])!,
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
      isOnCar: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_on_car'])!,
    );
  }

  @override
  $CustomerItemsTable createAlias(String alias) {
    return $CustomerItemsTable(attachedDatabase, alias);
  }
}

class CustomerItem extends DataClass implements Insertable<CustomerItem> {
  final int id;
  final int customerInvoiceId;
  final String itemName;
  final int quantity;
  final int price;
  final bool isOnCar;
  const CustomerItem(
      {required this.id,
      required this.customerInvoiceId,
      required this.itemName,
      required this.quantity,
      required this.price,
      required this.isOnCar});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_invoice_id'] = Variable<int>(customerInvoiceId);
    map['item_name'] = Variable<String>(itemName);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<int>(price);
    map['is_on_car'] = Variable<bool>(isOnCar);
    return map;
  }

  CustomerItemsCompanion toCompanion(bool nullToAbsent) {
    return CustomerItemsCompanion(
      id: Value(id),
      customerInvoiceId: Value(customerInvoiceId),
      itemName: Value(itemName),
      quantity: Value(quantity),
      price: Value(price),
      isOnCar: Value(isOnCar),
    );
  }

  factory CustomerItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerItem(
      id: serializer.fromJson<int>(json['id']),
      customerInvoiceId: serializer.fromJson<int>(json['customerInvoiceId']),
      itemName: serializer.fromJson<String>(json['itemName']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int>(json['price']),
      isOnCar: serializer.fromJson<bool>(json['isOnCar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerInvoiceId': serializer.toJson<int>(customerInvoiceId),
      'itemName': serializer.toJson<String>(itemName),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int>(price),
      'isOnCar': serializer.toJson<bool>(isOnCar),
    };
  }

  CustomerItem copyWith(
          {int? id,
          int? customerInvoiceId,
          String? itemName,
          int? quantity,
          int? price,
          bool? isOnCar}) =>
      CustomerItem(
        id: id ?? this.id,
        customerInvoiceId: customerInvoiceId ?? this.customerInvoiceId,
        itemName: itemName ?? this.itemName,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        isOnCar: isOnCar ?? this.isOnCar,
      );
  @override
  String toString() {
    return (StringBuffer('CustomerItem(')
          ..write('id: $id, ')
          ..write('customerInvoiceId: $customerInvoiceId, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('isOnCar: $isOnCar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, customerInvoiceId, itemName, quantity, price, isOnCar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerItem &&
          other.id == this.id &&
          other.customerInvoiceId == this.customerInvoiceId &&
          other.itemName == this.itemName &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.isOnCar == this.isOnCar);
}

class CustomerItemsCompanion extends UpdateCompanion<CustomerItem> {
  final Value<int> id;
  final Value<int> customerInvoiceId;
  final Value<String> itemName;
  final Value<int> quantity;
  final Value<int> price;
  final Value<bool> isOnCar;
  const CustomerItemsCompanion({
    this.id = const Value.absent(),
    this.customerInvoiceId = const Value.absent(),
    this.itemName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.isOnCar = const Value.absent(),
  });
  CustomerItemsCompanion.insert({
    this.id = const Value.absent(),
    required int customerInvoiceId,
    required String itemName,
    required int quantity,
    required int price,
    this.isOnCar = const Value.absent(),
  })  : customerInvoiceId = Value(customerInvoiceId),
        itemName = Value(itemName),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<CustomerItem> custom({
    Expression<int>? id,
    Expression<int>? customerInvoiceId,
    Expression<String>? itemName,
    Expression<int>? quantity,
    Expression<int>? price,
    Expression<bool>? isOnCar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerInvoiceId != null) 'customer_invoice_id': customerInvoiceId,
      if (itemName != null) 'item_name': itemName,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (isOnCar != null) 'is_on_car': isOnCar,
    });
  }

  CustomerItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? customerInvoiceId,
      Value<String>? itemName,
      Value<int>? quantity,
      Value<int>? price,
      Value<bool>? isOnCar}) {
    return CustomerItemsCompanion(
      id: id ?? this.id,
      customerInvoiceId: customerInvoiceId ?? this.customerInvoiceId,
      itemName: itemName ?? this.itemName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      isOnCar: isOnCar ?? this.isOnCar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerInvoiceId.present) {
      map['customer_invoice_id'] = Variable<int>(customerInvoiceId.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (isOnCar.present) {
      map['is_on_car'] = Variable<bool>(isOnCar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerItemsCompanion(')
          ..write('id: $id, ')
          ..write('customerInvoiceId: $customerInvoiceId, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('isOnCar: $isOnCar')
          ..write(')'))
        .toString();
  }
}

class $CarsTable extends Cars with TableInfo<$CarsTable, Car> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _carNumberMeta =
      const VerificationMeta('carNumber');
  @override
  late final GeneratedColumn<String> carNumber = GeneratedColumn<String>(
      'car_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerNameMeta =
      const VerificationMeta('ownerName');
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
      'owner_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPresentMeta =
      const VerificationMeta('isPresent');
  @override
  late final GeneratedColumn<bool> isPresent =
      GeneratedColumn<bool>('is_present', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_present" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, carNumber, ownerName, isPresent];
  @override
  String get aliasedName => _alias ?? 'cars';
  @override
  String get actualTableName => 'cars';
  @override
  VerificationContext validateIntegrity(Insertable<Car> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('car_number')) {
      context.handle(_carNumberMeta,
          carNumber.isAcceptableOrUnknown(data['car_number']!, _carNumberMeta));
    } else if (isInserting) {
      context.missing(_carNumberMeta);
    }
    if (data.containsKey('owner_name')) {
      context.handle(_ownerNameMeta,
          ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta));
    } else if (isInserting) {
      context.missing(_ownerNameMeta);
    }
    if (data.containsKey('is_present')) {
      context.handle(_isPresentMeta,
          isPresent.isAcceptableOrUnknown(data['is_present']!, _isPresentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Car map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Car(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      carNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}car_number'])!,
      ownerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_name'])!,
      isPresent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_present'])!,
    );
  }

  @override
  $CarsTable createAlias(String alias) {
    return $CarsTable(attachedDatabase, alias);
  }
}

class Car extends DataClass implements Insertable<Car> {
  final int id;
  final String carNumber;
  final String ownerName;
  final bool isPresent;
  const Car(
      {required this.id,
      required this.carNumber,
      required this.ownerName,
      required this.isPresent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['car_number'] = Variable<String>(carNumber);
    map['owner_name'] = Variable<String>(ownerName);
    map['is_present'] = Variable<bool>(isPresent);
    return map;
  }

  CarsCompanion toCompanion(bool nullToAbsent) {
    return CarsCompanion(
      id: Value(id),
      carNumber: Value(carNumber),
      ownerName: Value(ownerName),
      isPresent: Value(isPresent),
    );
  }

  factory Car.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Car(
      id: serializer.fromJson<int>(json['id']),
      carNumber: serializer.fromJson<String>(json['carNumber']),
      ownerName: serializer.fromJson<String>(json['ownerName']),
      isPresent: serializer.fromJson<bool>(json['isPresent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'carNumber': serializer.toJson<String>(carNumber),
      'ownerName': serializer.toJson<String>(ownerName),
      'isPresent': serializer.toJson<bool>(isPresent),
    };
  }

  Car copyWith(
          {int? id, String? carNumber, String? ownerName, bool? isPresent}) =>
      Car(
        id: id ?? this.id,
        carNumber: carNumber ?? this.carNumber,
        ownerName: ownerName ?? this.ownerName,
        isPresent: isPresent ?? this.isPresent,
      );
  @override
  String toString() {
    return (StringBuffer('Car(')
          ..write('id: $id, ')
          ..write('carNumber: $carNumber, ')
          ..write('ownerName: $ownerName, ')
          ..write('isPresent: $isPresent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, carNumber, ownerName, isPresent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Car &&
          other.id == this.id &&
          other.carNumber == this.carNumber &&
          other.ownerName == this.ownerName &&
          other.isPresent == this.isPresent);
}

class CarsCompanion extends UpdateCompanion<Car> {
  final Value<int> id;
  final Value<String> carNumber;
  final Value<String> ownerName;
  final Value<bool> isPresent;
  const CarsCompanion({
    this.id = const Value.absent(),
    this.carNumber = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.isPresent = const Value.absent(),
  });
  CarsCompanion.insert({
    this.id = const Value.absent(),
    required String carNumber,
    required String ownerName,
    this.isPresent = const Value.absent(),
  })  : carNumber = Value(carNumber),
        ownerName = Value(ownerName);
  static Insertable<Car> custom({
    Expression<int>? id,
    Expression<String>? carNumber,
    Expression<String>? ownerName,
    Expression<bool>? isPresent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (carNumber != null) 'car_number': carNumber,
      if (ownerName != null) 'owner_name': ownerName,
      if (isPresent != null) 'is_present': isPresent,
    });
  }

  CarsCompanion copyWith(
      {Value<int>? id,
      Value<String>? carNumber,
      Value<String>? ownerName,
      Value<bool>? isPresent}) {
    return CarsCompanion(
      id: id ?? this.id,
      carNumber: carNumber ?? this.carNumber,
      ownerName: ownerName ?? this.ownerName,
      isPresent: isPresent ?? this.isPresent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (carNumber.present) {
      map['car_number'] = Variable<String>(carNumber.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (isPresent.present) {
      map['is_present'] = Variable<bool>(isPresent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarsCompanion(')
          ..write('id: $id, ')
          ..write('carNumber: $carNumber, ')
          ..write('ownerName: $ownerName, ')
          ..write('isPresent: $isPresent')
          ..write(')'))
        .toString();
  }
}

class $DriversTable extends Drivers with TableInfo<$DriversTable, Driver> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriversTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _driverNameMeta =
      const VerificationMeta('driverName');
  @override
  late final GeneratedColumn<String> driverName = GeneratedColumn<String>(
      'driver_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPresentMeta =
      const VerificationMeta('isPresent');
  @override
  late final GeneratedColumn<bool> isPresent =
      GeneratedColumn<bool>('is_present', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_present" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, driverName, isPresent];
  @override
  String get aliasedName => _alias ?? 'drivers';
  @override
  String get actualTableName => 'drivers';
  @override
  VerificationContext validateIntegrity(Insertable<Driver> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('driver_name')) {
      context.handle(
          _driverNameMeta,
          driverName.isAcceptableOrUnknown(
              data['driver_name']!, _driverNameMeta));
    } else if (isInserting) {
      context.missing(_driverNameMeta);
    }
    if (data.containsKey('is_present')) {
      context.handle(_isPresentMeta,
          isPresent.isAcceptableOrUnknown(data['is_present']!, _isPresentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Driver map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Driver(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      driverName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}driver_name'])!,
      isPresent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_present'])!,
    );
  }

  @override
  $DriversTable createAlias(String alias) {
    return $DriversTable(attachedDatabase, alias);
  }
}

class Driver extends DataClass implements Insertable<Driver> {
  final int id;
  final String driverName;
  final bool isPresent;
  const Driver(
      {required this.id, required this.driverName, required this.isPresent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['driver_name'] = Variable<String>(driverName);
    map['is_present'] = Variable<bool>(isPresent);
    return map;
  }

  DriversCompanion toCompanion(bool nullToAbsent) {
    return DriversCompanion(
      id: Value(id),
      driverName: Value(driverName),
      isPresent: Value(isPresent),
    );
  }

  factory Driver.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Driver(
      id: serializer.fromJson<int>(json['id']),
      driverName: serializer.fromJson<String>(json['driverName']),
      isPresent: serializer.fromJson<bool>(json['isPresent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'driverName': serializer.toJson<String>(driverName),
      'isPresent': serializer.toJson<bool>(isPresent),
    };
  }

  Driver copyWith({int? id, String? driverName, bool? isPresent}) => Driver(
        id: id ?? this.id,
        driverName: driverName ?? this.driverName,
        isPresent: isPresent ?? this.isPresent,
      );
  @override
  String toString() {
    return (StringBuffer('Driver(')
          ..write('id: $id, ')
          ..write('driverName: $driverName, ')
          ..write('isPresent: $isPresent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, driverName, isPresent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Driver &&
          other.id == this.id &&
          other.driverName == this.driverName &&
          other.isPresent == this.isPresent);
}

class DriversCompanion extends UpdateCompanion<Driver> {
  final Value<int> id;
  final Value<String> driverName;
  final Value<bool> isPresent;
  const DriversCompanion({
    this.id = const Value.absent(),
    this.driverName = const Value.absent(),
    this.isPresent = const Value.absent(),
  });
  DriversCompanion.insert({
    this.id = const Value.absent(),
    required String driverName,
    this.isPresent = const Value.absent(),
  }) : driverName = Value(driverName);
  static Insertable<Driver> custom({
    Expression<int>? id,
    Expression<String>? driverName,
    Expression<bool>? isPresent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (driverName != null) 'driver_name': driverName,
      if (isPresent != null) 'is_present': isPresent,
    });
  }

  DriversCompanion copyWith(
      {Value<int>? id, Value<String>? driverName, Value<bool>? isPresent}) {
    return DriversCompanion(
      id: id ?? this.id,
      driverName: driverName ?? this.driverName,
      isPresent: isPresent ?? this.isPresent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (driverName.present) {
      map['driver_name'] = Variable<String>(driverName.value);
    }
    if (isPresent.present) {
      map['is_present'] = Variable<bool>(isPresent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriversCompanion(')
          ..write('id: $id, ')
          ..write('driverName: $driverName, ')
          ..write('isPresent: $isPresent')
          ..write(')'))
        .toString();
  }
}

class $TransportingItemsTable extends TransportingItems
    with TableInfo<$TransportingItemsTable, TransportingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransportingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES customer_items (id)'));
  static const VerificationMeta _carIdMeta = const VerificationMeta('carId');
  @override
  late final GeneratedColumn<int> carId = GeneratedColumn<int>(
      'car_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES cars (id)'));
  static const VerificationMeta _driverIdMeta =
      const VerificationMeta('driverId');
  @override
  late final GeneratedColumn<int> driverId = GeneratedColumn<int>(
      'driver_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES drivers (id)'));
  static const VerificationMeta _transportDateMeta =
      const VerificationMeta('transportDate');
  @override
  late final GeneratedColumn<DateTime> transportDate =
      GeneratedColumn<DateTime>('transport_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isArrivedMeta =
      const VerificationMeta('isArrived');
  @override
  late final GeneratedColumn<bool> isArrived =
      GeneratedColumn<bool>('is_arrived', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_arrived" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemId, carId, driverId, transportDate, isArrived];
  @override
  String get aliasedName => _alias ?? 'transporting_items';
  @override
  String get actualTableName => 'transporting_items';
  @override
  VerificationContext validateIntegrity(Insertable<TransportingItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('car_id')) {
      context.handle(
          _carIdMeta, carId.isAcceptableOrUnknown(data['car_id']!, _carIdMeta));
    } else if (isInserting) {
      context.missing(_carIdMeta);
    }
    if (data.containsKey('driver_id')) {
      context.handle(_driverIdMeta,
          driverId.isAcceptableOrUnknown(data['driver_id']!, _driverIdMeta));
    }
    if (data.containsKey('transport_date')) {
      context.handle(
          _transportDateMeta,
          transportDate.isAcceptableOrUnknown(
              data['transport_date']!, _transportDateMeta));
    } else if (isInserting) {
      context.missing(_transportDateMeta);
    }
    if (data.containsKey('is_arrived')) {
      context.handle(_isArrivedMeta,
          isArrived.isAcceptableOrUnknown(data['is_arrived']!, _isArrivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransportingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransportingItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      carId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}car_id'])!,
      driverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}driver_id']),
      transportDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transport_date'])!,
      isArrived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_arrived'])!,
    );
  }

  @override
  $TransportingItemsTable createAlias(String alias) {
    return $TransportingItemsTable(attachedDatabase, alias);
  }
}

class TransportingItem extends DataClass
    implements Insertable<TransportingItem> {
  final int id;
  final int itemId;
  final int carId;
  final int? driverId;
  final DateTime transportDate;
  final bool isArrived;
  const TransportingItem(
      {required this.id,
      required this.itemId,
      required this.carId,
      this.driverId,
      required this.transportDate,
      required this.isArrived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['car_id'] = Variable<int>(carId);
    if (!nullToAbsent || driverId != null) {
      map['driver_id'] = Variable<int>(driverId);
    }
    map['transport_date'] = Variable<DateTime>(transportDate);
    map['is_arrived'] = Variable<bool>(isArrived);
    return map;
  }

  TransportingItemsCompanion toCompanion(bool nullToAbsent) {
    return TransportingItemsCompanion(
      id: Value(id),
      itemId: Value(itemId),
      carId: Value(carId),
      driverId: driverId == null && nullToAbsent
          ? const Value.absent()
          : Value(driverId),
      transportDate: Value(transportDate),
      isArrived: Value(isArrived),
    );
  }

  factory TransportingItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransportingItem(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      carId: serializer.fromJson<int>(json['carId']),
      driverId: serializer.fromJson<int?>(json['driverId']),
      transportDate: serializer.fromJson<DateTime>(json['transportDate']),
      isArrived: serializer.fromJson<bool>(json['isArrived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'carId': serializer.toJson<int>(carId),
      'driverId': serializer.toJson<int?>(driverId),
      'transportDate': serializer.toJson<DateTime>(transportDate),
      'isArrived': serializer.toJson<bool>(isArrived),
    };
  }

  TransportingItem copyWith(
          {int? id,
          int? itemId,
          int? carId,
          Value<int?> driverId = const Value.absent(),
          DateTime? transportDate,
          bool? isArrived}) =>
      TransportingItem(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        carId: carId ?? this.carId,
        driverId: driverId.present ? driverId.value : this.driverId,
        transportDate: transportDate ?? this.transportDate,
        isArrived: isArrived ?? this.isArrived,
      );
  @override
  String toString() {
    return (StringBuffer('TransportingItem(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('carId: $carId, ')
          ..write('driverId: $driverId, ')
          ..write('transportDate: $transportDate, ')
          ..write('isArrived: $isArrived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, itemId, carId, driverId, transportDate, isArrived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransportingItem &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.carId == this.carId &&
          other.driverId == this.driverId &&
          other.transportDate == this.transportDate &&
          other.isArrived == this.isArrived);
}

class TransportingItemsCompanion extends UpdateCompanion<TransportingItem> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<int> carId;
  final Value<int?> driverId;
  final Value<DateTime> transportDate;
  final Value<bool> isArrived;
  const TransportingItemsCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.carId = const Value.absent(),
    this.driverId = const Value.absent(),
    this.transportDate = const Value.absent(),
    this.isArrived = const Value.absent(),
  });
  TransportingItemsCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required int carId,
    this.driverId = const Value.absent(),
    required DateTime transportDate,
    this.isArrived = const Value.absent(),
  })  : itemId = Value(itemId),
        carId = Value(carId),
        transportDate = Value(transportDate);
  static Insertable<TransportingItem> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<int>? carId,
    Expression<int>? driverId,
    Expression<DateTime>? transportDate,
    Expression<bool>? isArrived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (carId != null) 'car_id': carId,
      if (driverId != null) 'driver_id': driverId,
      if (transportDate != null) 'transport_date': transportDate,
      if (isArrived != null) 'is_arrived': isArrived,
    });
  }

  TransportingItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemId,
      Value<int>? carId,
      Value<int?>? driverId,
      Value<DateTime>? transportDate,
      Value<bool>? isArrived}) {
    return TransportingItemsCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      carId: carId ?? this.carId,
      driverId: driverId ?? this.driverId,
      transportDate: transportDate ?? this.transportDate,
      isArrived: isArrived ?? this.isArrived,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (carId.present) {
      map['car_id'] = Variable<int>(carId.value);
    }
    if (driverId.present) {
      map['driver_id'] = Variable<int>(driverId.value);
    }
    if (transportDate.present) {
      map['transport_date'] = Variable<DateTime>(transportDate.value);
    }
    if (isArrived.present) {
      map['is_arrived'] = Variable<bool>(isArrived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransportingItemsCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('carId: $carId, ')
          ..write('driverId: $driverId, ')
          ..write('transportDate: $transportDate, ')
          ..write('isArrived: $isArrived')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _driverIdMeta =
      const VerificationMeta('driverId');
  @override
  late final GeneratedColumn<int> driverId = GeneratedColumn<int>(
      'driver_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES drivers (id)'));
  static const VerificationMeta _carIdMeta = const VerificationMeta('carId');
  @override
  late final GeneratedColumn<int> carId = GeneratedColumn<int>(
      'car_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES cars (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, driverId, carId, description, amount, date];
  @override
  String get aliasedName => _alias ?? 'expenses';
  @override
  String get actualTableName => 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('driver_id')) {
      context.handle(_driverIdMeta,
          driverId.isAcceptableOrUnknown(data['driver_id']!, _driverIdMeta));
    } else if (isInserting) {
      context.missing(_driverIdMeta);
    }
    if (data.containsKey('car_id')) {
      context.handle(
          _carIdMeta, carId.isAcceptableOrUnknown(data['car_id']!, _carIdMeta));
    } else if (isInserting) {
      context.missing(_carIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      driverId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}driver_id'])!,
      carId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}car_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final int driverId;
  final int carId;
  final String? description;
  final int amount;
  final DateTime date;
  const Expense(
      {required this.id,
      required this.driverId,
      required this.carId,
      this.description,
      required this.amount,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['driver_id'] = Variable<int>(driverId);
    map['car_id'] = Variable<int>(carId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['amount'] = Variable<int>(amount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      driverId: Value(driverId),
      carId: Value(carId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      amount: Value(amount),
      date: Value(date),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      driverId: serializer.fromJson<int>(json['driverId']),
      carId: serializer.fromJson<int>(json['carId']),
      description: serializer.fromJson<String?>(json['description']),
      amount: serializer.fromJson<int>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'driverId': serializer.toJson<int>(driverId),
      'carId': serializer.toJson<int>(carId),
      'description': serializer.toJson<String?>(description),
      'amount': serializer.toJson<int>(amount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Expense copyWith(
          {int? id,
          int? driverId,
          int? carId,
          Value<String?> description = const Value.absent(),
          int? amount,
          DateTime? date}) =>
      Expense(
        id: id ?? this.id,
        driverId: driverId ?? this.driverId,
        carId: carId ?? this.carId,
        description: description.present ? description.value : this.description,
        amount: amount ?? this.amount,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('driverId: $driverId, ')
          ..write('carId: $carId, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, driverId, carId, description, amount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.driverId == this.driverId &&
          other.carId == this.carId &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.date == this.date);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<int> driverId;
  final Value<int> carId;
  final Value<String?> description;
  final Value<int> amount;
  final Value<DateTime> date;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.driverId = const Value.absent(),
    this.carId = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required int driverId,
    required int carId,
    this.description = const Value.absent(),
    required int amount,
    required DateTime date,
  })  : driverId = Value(driverId),
        carId = Value(carId),
        amount = Value(amount),
        date = Value(date);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<int>? driverId,
    Expression<int>? carId,
    Expression<String>? description,
    Expression<int>? amount,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (driverId != null) 'driver_id': driverId,
      if (carId != null) 'car_id': carId,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int>? id,
      Value<int>? driverId,
      Value<int>? carId,
      Value<String?>? description,
      Value<int>? amount,
      Value<DateTime>? date}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      driverId: driverId ?? this.driverId,
      carId: carId ?? this.carId,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (driverId.present) {
      map['driver_id'] = Variable<int>(driverId.value);
    }
    if (carId.present) {
      map['car_id'] = Variable<int>(carId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('driverId: $driverId, ')
          ..write('carId: $carId, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CustomerInvoicesTable customerInvoices =
      $CustomerInvoicesTable(this);
  late final $CustomerItemsTable customerItems = $CustomerItemsTable(this);
  late final $CarsTable cars = $CarsTable(this);
  late final $DriversTable drivers = $DriversTable(this);
  late final $TransportingItemsTable transportingItems =
      $TransportingItemsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final CustomerInvoicesDao customerInvoicesDao =
      CustomerInvoicesDao(this as AppDb);
  late final CustomerItemsDao customerItemsDao =
      CustomerItemsDao(this as AppDb);
  late final CarsDao carsDao = CarsDao(this as AppDb);
  late final DriversDao driversDao = DriversDao(this as AppDb);
  late final TransportingItemsDao transportingItemsDao =
      TransportingItemsDao(this as AppDb);
  late final ExpensesDao expensesDao = ExpensesDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        customerInvoices,
        customerItems,
        cars,
        drivers,
        transportingItems,
        expenses
      ];
}

mixin _$CustomerInvoicesDaoMixin on DatabaseAccessor<AppDb> {
  $CustomerInvoicesTable get customerInvoices =>
      attachedDatabase.customerInvoices;
}
mixin _$CustomerItemsDaoMixin on DatabaseAccessor<AppDb> {
  $CustomerInvoicesTable get customerInvoices =>
      attachedDatabase.customerInvoices;
  $CustomerItemsTable get customerItems => attachedDatabase.customerItems;
}
mixin _$CarsDaoMixin on DatabaseAccessor<AppDb> {
  $CarsTable get cars => attachedDatabase.cars;
}
mixin _$DriversDaoMixin on DatabaseAccessor<AppDb> {
  $DriversTable get drivers => attachedDatabase.drivers;
}
mixin _$TransportingItemsDaoMixin on DatabaseAccessor<AppDb> {
  $CustomerInvoicesTable get customerInvoices =>
      attachedDatabase.customerInvoices;
  $CustomerItemsTable get customerItems => attachedDatabase.customerItems;
  $CarsTable get cars => attachedDatabase.cars;
  $DriversTable get drivers => attachedDatabase.drivers;
  $TransportingItemsTable get transportingItems =>
      attachedDatabase.transportingItems;
}
mixin _$ExpensesDaoMixin on DatabaseAccessor<AppDb> {
  $DriversTable get drivers => attachedDatabase.drivers;
  $CarsTable get cars => attachedDatabase.cars;
  $ExpensesTable get expenses => attachedDatabase.expenses;
}
