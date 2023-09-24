import 'package:cargo_packaging/database/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../../providers/customer_info_manager.dart';
import '../../providers/item_manager.dart';
import './invoice_checkout_screen.dart';
import '../widgets/custom_intput_field.dart';
import '../../utils/form_text_validation.dart';

class CustomerItemResigterScreen extends StatelessWidget {
  const CustomerItemResigterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ပစ္စည်းစာရင်းသွင်းရန်'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InvoiceCheckoutScreen(),
            ),
          );
        },
        child: const Icon(Icons.forward),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: const [
              ItemInputForm(),
              SizedBox(height: 15.0),
              CheckOutCheckbox(),
              Divider(),
              SizedBox(height: 15.0),
              SlidableCardItemList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemInputForm extends StatefulWidget {
  const ItemInputForm({super.key});

  @override
  State<ItemInputForm> createState() => _ItemInputFormState();
}

class _ItemInputFormState extends State<ItemInputForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController itemNameController = TextEditingController();
    int price = 0;
    int quantity = 0;
    final formKey = GlobalKey<FormState>();

    InputDecoration inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      labelText: 'ပစ္စည်းအမည်',
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CustomDropdownItem(
            //   onItemNameChanged: (name) {
            //     itemName = name;
            //   },
            // ),
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: inputDecoration,
                controller: itemNameController,
              ),
              suggestionsCallback: (pattern) async {
                List<CustomerItem> items =
                    await Provider.of<AppDb>(context, listen: false)
                        .customerItemsDao
                        .getCustomerItems();
                List<String> itemNames =
                    items.map((item) => item.itemName).toSet().toList();
                itemNames =
                    itemNames.where((e) => e.contains(pattern.trim())).toList();
                itemNames.sort();
                return itemNames;
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                itemNameController.text = suggestion;
              },
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    labelText: 'တန်ဖိုး',
                    validator: numberValidation('တန်ဖိုး'),
                    textInputType: TextInputType.number,
                    onChange: (newValue) {
                      price = int.parse(newValue);
                    },
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: CustomInputField(
                    labelText: 'အရေအတွက်',
                    validator: numberValidation('အရေအတွက်'),
                    textInputType: TextInputType.number,
                    onChange: (newValue) {
                      quantity = int.parse(newValue);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 15.0),
                ),
                backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary),
                foregroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.onPrimary),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ItemManager>().addNewItem(
                        name: itemNameController.text,
                        price: price,
                        quantity: quantity,
                      );
                  formKey.currentState!.reset();
                  itemNameController.clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: const Text('ပစ္စည်းစာရင်းမှတ်ရန်'),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomDropdownItem extends StatefulWidget {
//   const CustomDropdownItem({
//     super.key,
//     required this.onItemNameChanged,
//   });
//   final void Function(String) onItemNameChanged;

//   @override
//   State<CustomDropdownItem> createState() => _CustomDropdownItemState();
// }

// class _CustomDropdownItemState extends State<CustomDropdownItem> {
//   final _nameController = TextEditingController();
//   String _itemName = '';
//   @override
//   void initState() {
//     // : implement initState
//     super.initState();
//     _nameController.addListener(() {
//       setState(() {
//         _itemName = _nameController.text;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     // : implement dispose
//     _nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String bigBox = 'ဂျပ်ဖာကြီး';
//     String mediumBox = 'ဂျပ်ဖာလတ်';
//     String smallBox = 'ဂျပ်ဖာသေး';
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: CustomInputField(
//             labelText: 'ပစ္စည်းအမည်',
//             validator: textValidation('ပစ္စည်းအမည်'),
//             controller: _nameController,
//             onChange: (newItem) {
//               setState(() {
//                 _itemName = newItem;
//               });
//               widget.onItemNameChanged(newItem);
//             },
//           ),
//         ),
//         PopupMenuButton(
//           icon: const Icon(Icons.menu),
//           itemBuilder: (context) {
//             return <PopupMenuEntry>[
//               PopupMenuItem(
//                 value: 1,
//                 child: Text(bigBox),
//               ),
//               PopupMenuItem(
//                 value: 2,
//                 child: Text(mediumBox),
//               ),
//               PopupMenuItem(
//                 value: 3,
//                 child: Text(smallBox),
//               ),
//             ];
//           },
//           onSelected: (value) {
//             if (value == 1) {
//               _nameController.text = bigBox;
//             } else if (value == 2) {
//               _nameController.text = mediumBox;
//             } else {
//               _nameController.text = smallBox;
//             }
//             widget.onItemNameChanged(_itemName);
//           },
//         ),
//       ],
//     );
//   }
// }

class CheckOutCheckbox extends StatelessWidget {
  const CheckOutCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerInfoManager>(builder: (context, manager, child) {
      return CheckboxListTile(
        title: const Text('ငွေရှင်းပြီး'),
        value: manager.isCheckOut,
        onChanged: (value) {
          context.read<CustomerInfoManager>().changeIsCheckOut(value);
        },
      );
    });
  }
}

class SlidableCardItemList extends StatelessWidget {
  const SlidableCardItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemManager>(
      builder: (context, manager, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: manager.getItems.length,
            itemBuilder: (context, index) {
              Item item = manager.getItems[index];

              return SlidableCardItem(
                itemName: item.name,
                price: item.price,
                quantity: item.quantity,
                idx: index,
              );
            },
          ),
        );
      },
    );
  }
}

class SlidableCardItem extends StatelessWidget {
  const SlidableCardItem({
    super.key,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.idx,
  });

  final String itemName;
  final int quantity;
  final int price;
  final int idx;

  @override
  Widget build(BuildContext context) {
    int total = quantity * price;
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Provider.of<ItemManager>(context, listen: false).removeItem(idx);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'ဖျက်ရန်',
          ),
        ],
      ),
      child: Card(
        elevation: 3.0,
        surfaceTintColor: Theme.of(context).secondaryHeaderColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'qty $quantity x $price',
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$total', style: Theme.of(context).textTheme.titleLarge),
                  const Text('kyats'),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
