// import 'dart:math';

import 'package:flutter/material.dart';
import 'option.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({
    super.key,
    required this.options,
    this.totalVisibleOptions = 5,
    required this.selectOption,
    required this.selectedIndex,
    required this.selectMore,
    required this.title,
  });

  final List<Option> options;
  final int totalVisibleOptions;
  final void Function(int) selectOption;
  final int selectedIndex;
  final void Function() selectMore;
  final String title;

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildOptionItem(int optionIndex) {
    bool isSelected = widget.selectedIndex == optionIndex;

    return GestureDetector(
      onTap: () {
        widget.selectOption(optionIndex);
      },
      child: Card(
        // shape: ,
        margin: const EdgeInsets.all(8),
        color: isSelected
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).colorScheme.background,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(isSelected
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YBdeGL3VflF9KdKQFFmE2y6zfCf9bACn0A&usqp=CAU'
                      : widget.options[optionIndex]
                          .icon), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.options[optionIndex].name,
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ), // Display the option name
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.options);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemCount: widget.options.length <= widget.totalVisibleOptions
                    ? widget.options.length
                    : widget.totalVisibleOptions + 1,
                itemBuilder: (context, index) {
                  if (index == widget.totalVisibleOptions &&
                      widget.options.length > widget.totalVisibleOptions) {
                    return GestureDetector(
                      onTap: widget.selectMore,
                      child: Card(
                        // shape: ,
                        margin: const EdgeInsets.all(8),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYLb4fHlPF-aw_5Ea494xaBQDJ7b6DOlY2ng&usqp=CAU'), // Replace with your image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'More',
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ), // Display the option name
                          ],
                        ),
                      ),
                    );
                  } else {
                    // final listItemIndex =
                    //     index < widget.totalVisibleOptions ? index : index - 1;
                    return buildOptionItem(index);
                  }
                }),
          ),
        ]);
  }
}
