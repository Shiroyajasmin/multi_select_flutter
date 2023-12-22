import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MultiSelect Flutter Demo'),
        ),
        body: MultiSelectScreen(),
      ),
    );
  }
}

class MultiSelectScreen extends StatefulWidget {
  @override
  _MultiSelectScreenState createState() => _MultiSelectScreenState();
}

class _MultiSelectScreenState extends State<MultiSelectScreen> {
  // Sample data for options
  final List<String> items = List.generate(10, (index) => 'Item $index');

  // Track the selected items
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MultiSelectDialogField(
        items: items
            .map((item) => MultiSelectItem<String>(item, item))
            .toList(),
        listType: MultiSelectListType.CHIP,
        onConfirm: (values) {
          setState(() {
            selectedItems = values;
          });
        },
        buttonText: Text('Select Items'),
      ),
    );
  }
}
