import 'package:cargo_packaging/providers/invoice_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/db.dart';
import 'home.dart';
import 'providers/customer_info_manager.dart';
import 'providers/item_cargo_manager.dart';
import 'providers/item_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemManager>(
          create: (_) => ItemManager(),
        ),
        ChangeNotifierProvider<CustomerInfoManager>(
          create: (_) => CustomerInfoManager(),
        ),
        ChangeNotifierProvider<CargoItemManager>(
          create: (_) => CargoItemManager(),
        ),
        Provider(
          create: (_) => AppDb(),
          dispose: (_, db) => db.close(),
        ),
        ChangeNotifierProvider<InvoiceManager>(
          create: (_) => InvoiceManager(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          iconTheme: const IconThemeData()
              .copyWith(color: Theme.of(context).primaryColorDark),
          useMaterial3: true,
          // scaffoldBackgroundColor: const Color(0xf9f9f9f9),
        ),
        // darkTheme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}


// child: MaterialApp.router(
//   title: 'Cargo Items',
//   theme: ThemeData(
//     colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//     useMaterial3: true,
//     // bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     //   backgroundColor: Colors.blue,
//     //   selectedIconTheme: IconThemeData(
//     //     color: Colors.
//     //   )
//     scaffoldBackgroundColor: const Color(0xFFF0FEFA),
//   ),
//   // appBarTheme: AppBarTheme.of(context).copyWith(
//   //   backgroundColor: const Color(0xFF1877F2),
//   //   foregroundColor: const Color(0xFFFFFFFF),
//   // ),

//   debugShowCheckedModeBanner: false,
//   routerConfig: _router,
// ),