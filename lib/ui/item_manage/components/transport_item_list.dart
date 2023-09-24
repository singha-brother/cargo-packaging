import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../../../database/db.dart';
import '../../../database/query_models.dart';
import '../../../providers/item_cargo_manager.dart';
import 'transport_item_tile.dart';

class TransportItemsList extends StatelessWidget {
  const TransportItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AppDb>(context, listen: false)
          .customerItemsDao
          .watchItemsWithCustomerInvoice(),
      builder:
          (context, AsyncSnapshot<List<ItemWithCustomerInvoice>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<ItemWithCustomerInvoice> items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Text('ကားပေါ်တင်ရန် ပစ္စည်းမရှိပါ။'),
            );
          }

          return TransportItemsListWithSearch(items: items);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class TransportItemsListWithSearch extends StatefulWidget {
  const TransportItemsListWithSearch({
    super.key,
    required this.items,
  });

  final List<ItemWithCustomerInvoice> items;

  @override
  State<TransportItemsListWithSearch> createState() =>
      _TransportItemsListWithSearchState();
}

class _TransportItemsListWithSearchState
    extends State<TransportItemsListWithSearch> {
  List<String> suggestNames = [];
  List<String> itemNames = [];
  String searchName = '';
  String searchItem = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    suggestNames.addAll(
      widget.items.map((item) => item.customerInvoice.customerName),
    );
    suggestNames.addAll(
      widget.items.map((item) => item.customerInvoice.receiverName),
    );
    suggestNames = suggestNames.toSet().toList();
    suggestNames.sort();

    itemNames.addAll(
      widget.items.map((item) => item.customerItem.itemName),
    );
    itemNames = itemNames.toSet().toList();
    itemNames.sort();
  }

  void setSearchName(String value) {
    setState(() {
      searchName = value;
    });
  }

  void setSearchItem(String value) {
    setState(() {
      searchItem = value;
    });
  }

  void resetSearch() {
    setState(() {
      searchName = '';
      searchItem = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSelecting = Provider.of<CargoItemManager>(context).isSelecting;
    String searchText = '';

    List<ItemWithCustomerInvoice> showItems = widget.items;

    if (searchName.isNotEmpty) {
      searchText = searchName;
      showItems = widget.items
          .where((item) => item.customerInvoice.customerName == searchName)
          .toList();
      showItems.addAll(widget.items
          .where((item) => item.customerInvoice.receiverName == searchName));
    }

    if (searchItem.isNotEmpty) {
      searchText += '... $searchItem';
      showItems = showItems
          .where((item) => item.customerItem.itemName == searchItem)
          .toList();
    }

    if (searchText.isEmpty) {
      searchText = 'ရှာဖွေရန်';
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemCount: showItems.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 20.0),
              itemBuilder: (context, index) {
                return TransportItemTile(
                  itemWithInfo: showItems[index],
                  isSelecting: isSelecting,
                );
              }),
        ),
        const SizedBox(height: 10),
        ItemsSearch(
          suggestNames: suggestNames,
          itemNames: itemNames,
          searchText: searchText,
          setSearchItem: setSearchItem,
          setSearchName: setSearchName,
          resetSearch: resetSearch,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ItemsSearch extends StatefulWidget {
  const ItemsSearch({
    super.key,
    required this.suggestNames,
    required this.itemNames,
    required this.searchText,
    required this.setSearchName,
    required this.setSearchItem,
    required this.resetSearch,
  });

  final List<String> suggestNames;
  final List<String> itemNames;
  final String searchText;
  final void Function(String value) setSearchName;
  final void Function(String value) setSearchItem;
  final void Function() resetSearch;

  @override
  State<ItemsSearch> createState() => _ItemsSearchState();
}

class _ItemsSearchState extends State<ItemsSearch> {
  TextEditingController nameController = TextEditingController();
  TextEditingController itemController = TextEditingController();

  @override
  void dispose() {
    // : implement dispose
    super.dispose();
    nameController.dispose();
    itemController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'အမည်ဖြင့် ရှာဖွေရန်',
                              ),
                            ),
                            suggestionsCallback: (pattern) {
                              return widget.suggestNames;
                            },
                            itemBuilder: (context, itemData) {
                              return ListTile(title: Text(itemData));
                            },
                            onSuggestionSelected: (suggestion) {
                              nameController.text = suggestion;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: itemController,
                              decoration: const InputDecoration(
                                labelText: 'ပစ္စည်းအမည်ဖြင့် ရှာဖွေရန်',
                              ),
                            ),
                            suggestionsCallback: (pattern) {
                              return widget.itemNames;
                            },
                            itemBuilder: (context, itemData) {
                              return ListTile(title: Text(itemData));
                            },
                            onSuggestionSelected: (suggestion) {
                              itemController.text = suggestion;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            widget.setSearchItem(itemController.text);
                            widget.setSearchName(nameController.text);
                            itemController.clear();
                            nameController.clear();
                            Navigator.of(context).pop();
                          },
                          style: const ButtonStyle().copyWith(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Theme.of(context).primaryColor),
                            foregroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('ရှာဖွေရန်'),
                          ),
                        )
                      ]),
                );
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 3)
              ],
              color: Theme.of(context).cardColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
            child: Text(
              widget.searchText,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: widget.resetSearch,
          icon: Icon(
            Icons.refresh,
            size: 40,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
