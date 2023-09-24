import 'package:flutter/material.dart';

import './car_input_form.dart';
import './car_list_view.dart';
import './driver_input_form.dart';
import './driver_list_view.dart';

class ManageCarListScreen extends StatelessWidget {
  const ManageCarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.directions_car,
                ),
              ),
              Tab(
                icon: Icon(Icons.people),
              )
            ],
          ),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TabBarView(
                children: [
                  _buildCarListScreen(context),
                  _buildDriverListScreen(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarListScreen(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          elevation: 1.0,
          child: const Icon(Icons.add),
          // color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CarInputForm(),
              ),
            );
          }),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: CarsListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverListScreen(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DriverInputForm(),
            ),
          );
        },
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: DriversListView(),
          ),
        ],
      ),
    );
  }
}
