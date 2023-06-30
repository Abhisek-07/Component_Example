import 'package:flutter/material.dart';
import 'package:component_example/payment_options.dart';
import 'package:flutter/services.dart';
import 'option.dart';
import 'dart:convert';
import 'all_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Option> options = [];

  Future<List<Option>> loadOptions() async {
    final jsonData = await rootBundle.loadString('assets/options.json');
    final jsonOptions = json.decode(jsonData);
    List<dynamic> list = jsonOptions['data'];
    options = list.map((option) => Option.fromJson(option)).toList();
    return options;
  }

  @override
  void initState() {
    super.initState();
  }

  void selectOption(Option option) {
    print('selected option');
    if (option.name == 'More') {
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (context) {
      //     return AllOptions(
      //       options: options,
      //     );
      //   },
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(options);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Component'),
        ),
        // body: PaymentOptions(
        //   options: options,
        //   totalVisibleOptions: 10,
        //   selectOption: selectOption,
        // ),
        body: FutureBuilder(
            future: loadOptions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                final options = snapshot.data!;
                return PaymentOptions(
                  options: options,
                  totalVisibleOptions: 7,
                  selectOption: selectOption,
                );
              } else {
                return const Center(
                  child: Text('No data'),
                );
              }
            }),
      ),
    );
  }
}
