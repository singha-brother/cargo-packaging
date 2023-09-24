import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/customer_info_manager.dart';
import '../../utils/form_text_validation.dart';
import './item_register_screen.dart';
import '../widgets/custom_header_text.dart';
import '../widgets/custom_intput_field.dart';

class CustomerItemRegisterScreen extends StatelessWidget {
  CustomerItemRegisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Items'),
      ),
      // resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomerItemResigterScreen(),
              ),
            );
          }
        },
        child: const Icon(Icons.forward),
      ),
      body: GestureDetector(
        // TO DISMISS KEYBOARD WHEN TAPPING OUTSIDE INPUTS
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCustomerInfoInput(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerInfoInput(BuildContext context) {
    // INITIATE VALUES FROM CUSTOMER INFO MANAGER
    CustomerInfoManager customerInfoManager = context.read();
    // Provider.of<CustomerInfoManager>(context, listen: false);

    String initName = customerInfoManager.name;
    String recvName = customerInfoManager.receiverName;
    String fromLoc = customerInfoManager.fromLocation;
    String toLoc = customerInfoManager.toLocation;
    String customerPhone = customerInfoManager.customerPhone;
    String receiverPhone = customerInfoManager.receiverPhone;

    // DROPDOWN ITEMS
    List<DropdownMenuItem<String>> dropdownItems = <String>[
      'Monywa',
      'Mandalay',
      'Yangon',
      'Pyin Oo Lwin',
      'Nay Pyi Taw'
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
        ),
      );
    }).toList();

    const double gapHeightSmall = 15.0;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          const SizedBox(
            width: double.infinity,
            child: CustomHeaderText(titleText: 'ပေးပို့သူ'),
          ),
          const SizedBox(height: gapHeightSmall),
          CustomInputField(
            labelText: 'အမည်',
            onChange: (newValue) {
              customerInfoManager.changeName(newValue);
            },
            validator: textValidation('အမည်'),
            initialValue: initName,
          ),
          const SizedBox(height: gapHeightSmall),
          CustomInputField(
            labelText: 'ဖုန်းနံပါတ်',
            textInputType: TextInputType.phone,
            initialValue: customerPhone,
            onChange: (newValue) {
              customerInfoManager.changeCustomerPhone(newValue);
            },
            validator: textValidation('phone number'),
          ),
          const SizedBox(height: gapHeightSmall),
          CustomInputField(
            labelText: 'နေရပ်လိပ်စာ',
            onChange: (newValue) {
              customerInfoManager.changeFromLocation(newValue);
            },
            validator: textValidation('current location'),
            initialValue: fromLoc,
          ),
          const SizedBox(height: gapHeightSmall),
          Row(
            children: [
              const Expanded(child: Text('(မြို့နယ်ရွေးပေးပါ)')),
              Consumer<CustomerInfoManager>(builder: (context, manager, _) {
                return DropdownButton(
                    value: manager.fromTownship,
                    items: dropdownItems,
                    onChanged: (value) {
                      manager.changeFromTownship(value);
                    });
              })
            ],
          ),
          const SizedBox(height: gapHeightSmall * 2),

          //////////////////////////////////
          /////////// RECEIVER /////////////
          //////////////////////////////////
          const SizedBox(
            width: double.infinity,
            child: CustomHeaderText(titleText: 'လက်ခံသူ'),
          ),
          const SizedBox(height: gapHeightSmall),
          CustomInputField(
            labelText: 'အမည်',
            onChange: (newValue) {
              customerInfoManager.changeReceiverName(newValue);
            },
            validator: textValidation('လက်ခံသူအမည်'),
            initialValue: recvName,
          ),
          const SizedBox(height: gapHeightSmall),
          CustomInputField(
            labelText: 'ဖုန်းနံပါတ်',
            initialValue: receiverPhone,
            onChange: (newValue) {
              customerInfoManager.changeReceiverPhone(newValue);
            },
            textInputType: TextInputType.phone,
            validator: textValidation('phone number'),
          ),
          const SizedBox(height: gapHeightSmall),
          CustomInputField(
            labelText: 'နေရပ်လိပ်စာ',
            onChange: (newValue) {
              customerInfoManager.changeToLocation(newValue);
            },
            validator: textValidation('location of destination'),
            initialValue: toLoc,
          ),
          const SizedBox(height: gapHeightSmall),
          Row(
            children: [
              const Expanded(child: Text('(မြို့နယ်ရွေးပေးပါ)')),
              Consumer<CustomerInfoManager>(builder: (context, manager, _) {
                return DropdownButton(
                    value: manager.toTownship,
                    items: dropdownItems,
                    onChanged: (value) {
                      manager.changeToTownship(value);
                    });
              })
            ],
          ),
          const SizedBox(height: gapHeightSmall),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
