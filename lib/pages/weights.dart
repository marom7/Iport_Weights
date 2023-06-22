// ignore_for_file: prefer_final_fields
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

late Widget tableWeights;

class WightsEntPage extends StatefulWidget {
  const WightsEntPage({Key? key}) : super(key: key);

  @override
  State<WightsEntPage> createState() => _WightsEntPageState();
}

class _WightsEntPageState extends State<WightsEntPage> {
  // Generate a list of fiction prodcts
  List<Map> _weights = List.generate(30, (i) {
    return {
      "name": i + 1,
      "ip": "198.168.0.$i",
      "weight_1": Random().nextInt(150) + 1,
      "weight_2": Random().nextInt(150) + 1
    };
  });

  /* Map<String, dynamic> weights = {
    "name": "num1",
    "ip": "198.168.0.1",
    "weight_1": Random().nextInt(150) + 1,
    "weight_2": Random().nextInt(150) + 1
  }; */
  int _currentSortColumn = 0;
  bool _isAscending = true;
  bool isClockStart = false;
  late Timer timer;
  void _start() {
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      // Update the UI
      setState(() {
        for (int i = 0; i < _weights.length; i++) {
          _weights[i].update('weight_1', (value) => Random().nextInt(150) + 1);
          _weights[i].update('weight_2', (value) => Random().nextInt(100) + 1);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if (!isClockStart) {
      _start();
      isClockStart = true;
    }
    return TableOfWeights();
  }

  // ignore: non_constant_identifier_names
  Widget TableOfWeights() {
    tableWeights = Scaffold(
        appBar: AppBar(
          title: const Text('משקלים- נמל אשדוד'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 15.0,
              sortColumnIndex: _currentSortColumn,
              sortAscending: _isAscending,
              headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
              columns: [
                const DataColumn(label: Text('שם')),
                const DataColumn(label: Text('IP')),
                DataColumn(
                    label: const Text(
                      'משקל 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 143, 231),
                          fontWeight: FontWeight.bold),
                    ),
                    // Sorting function
                    onSort: (columnIndex, _) {
                      setState(() {
                        _currentSortColumn = columnIndex;
                        if (_isAscending == true) {
                          _isAscending = false;
                          // sort the product list in Ascending, order by Price
                          _weights.sort((productA, productB) =>
                              productB['weight_1']
                                  .compareTo(productA['weight_1']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _weights.sort((productA, productB) =>
                              productA['weight_1']
                                  .compareTo(productB['weight_1']));
                        }
                      });
                    }),
                DataColumn(
                    label: const Text(
                      'משקל 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 143, 231),
                          fontWeight: FontWeight.bold),
                    ),
                    // Sorting function
                    onSort: (columnIndex, _) {
                      setState(() {
                        _currentSortColumn = columnIndex;
                        if (_isAscending == true) {
                          _isAscending = false;
                          // sort the product list in Ascending, order by Price
                          _weights.sort((weightA, weightB) =>
                              weightB['weight_2']
                                  .compareTo(weightA['weight_2']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _weights.sort((weightA, weightB) =>
                              weightA['weight_2']
                                  .compareTo(weightB['weight_2']));
                        }
                      });
                    }),
              ],
              rows: _weights.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item['name'].toString())),
                  DataCell(Text(item['ip'].toString())),
                  DataCell(Center(
                      child: Text(
                    item['weight_1'].toString(),
                  ))),
                  DataCell(Center(
                      child: Text(
                    item['weight_2'].toString(),
                  )))
                ]);
              }).toList(),
            ),
          ),
        ));
    return tableWeights;
  }
}



//Text(
//                    item['name'].toString(),
 //                   textAlign: TextAlign.center,