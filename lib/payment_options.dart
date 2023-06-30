import 'dart:math';

import 'package:flutter/material.dart';
import 'option.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({
    super.key,
    required this.options,
    this.totalVisibleOptions = 5,
    required this.selectOption,
  });

  final List<Option> options;
  final int totalVisibleOptions;
  final void Function(Option option) selectOption;

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  List<Option> visibleOptionsList = [];

  @override
  void initState() {
    super.initState();
    updateVisibleOptions();
  }

  void updateVisibleOptions() {
    visibleOptionsList = widget.options
        .sublist(0, min(widget.totalVisibleOptions, widget.options.length));
    if (widget.options.length > widget.totalVisibleOptions) {
      visibleOptionsList.add(
        Option(
          name: 'More',
          icon: 'assets/more_icon.png',
        ),
      );
    }
  }

  Widget buildOptionItem(Option option) {
    return InkWell(
      onTap: () {
        widget.selectOption(option);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(option
            //     .icon), // Display the icon (replace with appropriate widget)
            // const SizedBox(height: 8.0),
            Text(option.name), // Display the option name
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.options);
    print(visibleOptionsList);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemCount: visibleOptionsList.length,
                itemBuilder: (context, index) {
                  return buildOptionItem(visibleOptionsList[index]);
                }),
          ),
        ]);
  }
}
