import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../dock/components/header.dart';
import 'components/cust_drop_down.dart';

class FifoPage extends StatefulWidget {
  const FifoPage({super.key});

  @override
  State<FifoPage> createState() => _FifoPageState();
}

class _FifoPageState extends State<FifoPage> {
  String selectedCustomer = '1';
  String selectedUsage = '1';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(title: ''),
            SizedBox(height: Constants.defaultPadding),
            FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: Column(
                children: [
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(2.0),
                    child: Row(
                      children: [
                        DropDownList<String>(
                          listItems: const [
                            ListItem<String>(
                              'Daiichi FASTENERS INDIA PVT LTD',
                              value: '1',
                            ),
                            ListItem<String>(
                              'JTEKT BEARING INDIA PVT LTD',
                              value: '2',
                            ),
                            ListItem<String>(
                              'NTECH Automotive PVT LTD',
                              value: '3',
                            ),
                          ],
                          value: selectedCustomer,
                          onChange: (value) => setState(() {
                            selectedCustomer = value!;
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DropDownList<String>(
                            listItems: const [
                              ListItem<String>(
                                'Before Inspection',
                                value: '1',
                              ),
                              ListItem<String>(
                                'Good Stock',
                                value: '2',
                              ),
                            ],
                            value: selectedUsage,
                            onChange: (value) => setState(() {
                              selectedUsage = value!;
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(1.0),
                    child: Column(
                      children: [
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
