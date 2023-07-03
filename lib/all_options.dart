import 'package:component_example/option.dart';
import 'package:flutter/material.dart';

class AllOptions extends StatefulWidget {
  const AllOptions({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelectListOption,
    required this.showIcons,
    required this.selectedIndexInListView,
  });

  final List<Option> options;
  final int selectedIndex;
  final void Function(int?) onSelectListOption;
  final bool showIcons;
  final int selectedIndexInListView;

  @override
  State<AllOptions> createState() => _AllOptionsState();
}

class _AllOptionsState extends State<AllOptions> {
  late List<Option> searchOptions;

  int? selectedIndex;
  final controller = TextEditingController();

  /// !!! SEARCH WILL BE IMPLEMENTED LATER

  // void searchCategory(String query) {
  //   final suggestions = searchOptions.where((option) {
  //     final title = option.name.toLowerCase();
  //     final input = query.toLowerCase();

  //     return title.contains(input);
  //   }).toList();

  //   setState(() {
  //     searchOptions = suggestions;
  //   });
  // }

  @override
  void initState() {
    searchOptions = widget.options;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an option'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: SizedBox(
              height: 40,
              child: TextField(
                // onChanged: searchCategory,
                controller: controller,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                bool isSelected = widget.selectedIndexInListView == index;

                /// THIS WILL BE IMPLEMENTED LATER TO TRACK THE SELECTED OPTION IN THE LISTVIEW

                return SizedBox(
                  width: double.infinity,
                  child: RadioListTile(
                    // fillColor: MaterialStateProperty.all(Colors.purple),
                    activeColor: Theme.of(context).colorScheme.primary,
                    selected: isSelected,
                    value: index,
                    groupValue: widget.selectedIndexInListView,
                    onChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                      widget.onSelectListOption(index);
                      Navigator.pop(context);
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Row(
                      children: [
                        widget.showIcons
                            ? Image.network(
                                widget.options[index].icon,
                                height: 24,
                                width: 24,
                              )
                            : Container(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(widget.options[index].name),
                      ],
                    ),
                  ),
                  // child: ListTile(
                  //   leading: widget.showIcons
                  //       ? Image.network(
                  //           widget.options[index].icon,
                  //           height: 24,
                  //           width: 24,
                  //         )
                  //       : Container(),
                  //   title: Text(widget.options[index].name),
                  //   trailing: Radio(
                  //       focusColor:
                  //           isSelected ? Theme.of(context).primaryColor : null,
                  //       value: index,
                  //       groupValue: selectedIndex,
                  //       onChanged: (index) {
                  //         setState(() {
                  //           selectedIndex = index;
                  //         });
                  //         widget.onSelectListOption(index);
                  //         Navigator.pop(context);
                  //       }),
                  // ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
