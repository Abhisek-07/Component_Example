import 'package:component_example/option.dart';
import 'package:flutter/material.dart';

class AllOptions extends StatefulWidget {
  const AllOptions({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelectListOption,
    required this.showIcons,
  });

  final List<Option> options;
  final int selectedIndex;
  final void Function(int?) onSelectListOption;
  final bool showIcons;

  @override
  State<AllOptions> createState() => _AllOptionsState();
}

class _AllOptionsState extends State<AllOptions> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an option'),
      ),
      body: ListView.builder(
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          // bool isSelected = widget.selectedIndex == index;  :- !!! /// THIS WILL BE IMPLEMENTED LATER TO TRACK THE SELECTED OPTION IN THE LISTVIEW

          return SizedBox(
            width: double.infinity,
            child: ListTile(
              leading: widget.showIcons
                  ? Image.network(
                      widget.options[index].icon,
                      height: 24,
                      width: 24,
                    )
                  : Container(),
              title: Text(widget.options[index].name),
              trailing: Radio(
                  // activeColor:
                  //     isSelected ? Theme.of(context).primaryColor : null,
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onSelectListOption(index);
                    Navigator.pop(context);
                  }),
            ),
          );
        },
      ),
    );
  }
}
