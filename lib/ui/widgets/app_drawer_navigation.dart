// import 'package:cargo_packaging/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';

// class AppDrawerNavigation extends StatelessWidget {
//   const AppDrawerNavigation({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Client Name',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         foregroundColor: Colors.white,
//         backgroundColor: AppColor.blue,
//         shadowColor: Colors.grey,
//         surfaceTintColor: Colors.white,
//         elevation: 1.0,
//       ),
//       body: child,
//       drawer: Drawer(
//         clipBehavior: Clip.hardEdge,
//         child: ListView(
//           padding: const EdgeInsets.all(0.0),
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: AppColor.blue,
//               ),
//               child: Center(
//                   child: Text(
//                 'Client Name',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22.0,
//                 ),
//               )),
//             ),
//             ListTile(
//               title: const Text('ကုန်ပစ္စည်းလက်ခံရန်'),
//               leading: const Icon(Icons.description_outlined),
//               onTap: () {
//                 GoRouter.of(context).goNamed('customers');
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//                 title: const Text('ကုန်ပစ္စည်းကားပေါ်တင်ရန်'),
//                 leading: const Icon(Icons.near_me),
//                 onTap: () {
//                   GoRouter.of(context).go('/cargo');
//                   Navigator.of(context).pop();
//                 }),
//             ListTile(
//                 title: const Text('ကားနှင့် ဒရိုင်ဘာ စီမံခန့်ခွဲရန်'),
//                 leading: const Icon(Icons.local_shipping_outlined),
//                 onTap: () {
//                   GoRouter.of(context).go('/cars');
//                   Navigator.of(context).pop();
//                 }),
//             ListTile(
//                 title: const Text('အသုံးစာရင်း'),
//                 leading: const Icon(Icons.attach_money),
//                 onTap: () {
//                   GoRouter.of(context).go('/expenses');
//                   Navigator.of(context).pop();
//                 }),
//             ListTile(
//               title: const Text('Reports'),
//               leading: const Icon(Icons.dashboard_rounded),
//               onTap: () {
//                 GoRouter.of(context).go('/report');
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // bottomNavigationBar: BottomNavigationBar(
//   //       items: const [
//   //         BottomNavigationBarItem(
//   //           icon: Icon(Icons.description_outlined),
//   //           activeIcon: Icon(Icons.description_rounded),
//   //           label: 'Customers',
//   //         ),
//   //         BottomNavigationBarItem(
//   //           icon: Icon(Icons.near_me_outlined),
//   //           label: 'Transport',
//   //         ),
//   //         BottomNavigationBarItem(
//   //           icon: Icon(Icons.local_shipping_outlined),
//   //           label: 'Cars',
//   //         ),
//   //         BottomNavigationBarItem(
//   //           icon: Icon(Icons.attach_money),
//   //           label: 'Expenses',
//   //         ),
//   //         BottomNavigationBarItem(
//   //           icon: Icon(Icons.dashboard_rounded),
//   //           label: 'Reports',
//   //         ),
//   //       ],
//   //       currentIndex: _calculatedSelectedIndex(context),
//   //       selectedItemColor: AppColor.blue,
//   //       unselectedItemColor: Colors.grey.shade500,
//   //       showUnselectedLabels: true,
//   //       onTap: (value) {
//   //         _onItemTapped(value, context);
//   //       },
//   //     ),

//   // static int _calculatedSelectedIndex(BuildContext context) {
//   //   final String location = GoRouterState.of(context).location;
//   //   if (location.startsWith('/customers')) {
//   //     return 0;
//   //   }
//   //   if (location.startsWith('/cargo')) {
//   //     return 1;
//   //   }
//   //   if (location.startsWith('/cars')) {
//   //     return 2;
//   //   }
//   //   if (location.startsWith('/expenses')) {
//   //     return 3;
//   //   }
//   //   if (location.startsWith('/report')) {
//   //     return 4;
//   //   }
//   //   return 0;
//   // }

//   // void _onItemTapped(int index, BuildContext context) {
//   //   switch (index) {
//   //     case 0:
//   //       GoRouter.of(context).go('/customers');
//   //       break;
//   //     case 1:
//   //       GoRouter.of(context).go('/cargo');
//   //       break;
//   //     case 2:
//   //       GoRouter.of(context).go('/cars');
//   //       break;
//   //     case 3:
//   //       GoRouter.of(context).go('/expenses');
//   //       break;
//   //     case 4:
//   //       GoRouter.of(context).go('/report');
//   //       break;
//   //   }
// }
