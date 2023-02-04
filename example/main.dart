import 'package:drop_down_list_menu/drop_down_list_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drop Down Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DropDown(),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final List<String> _list = ['One', 'Two', 'Three', 'Four', 'Five'];
  String _selectedItem = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Drop Down Menu'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: DropDownMenu(
                      title: 'Select an item',
                      enabled: true,
                      values: _list,
                      value: _selectedItem,
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value!;
                        });
                      },
                    ),
                  ),
                ),
              ]),
        ));
  }
}
