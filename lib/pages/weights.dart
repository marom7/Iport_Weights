import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../my_data.dart';

late Widget tableWeights;

class Weights extends StatefulWidget {
  const Weights({super.key});

  @override
  State<Weights> createState() => _WeightsState();
}

class _WeightsState extends State<Weights> {
  bool isClockStart = false;
  late Timer timer;
  void _start() {
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      // Update the UI

      setState(() {
        for (int i = 0; i < MyData.weights.length; i++) {
          MyData.weights[i]
              .update('weight_1', (value) => Random().nextInt(150) + 1);
          MyData.weights[i]
              .update('weight_2', (value) => Random().nextInt(100) + 1);
        }
      });
    });
  }

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  @override
  Widget build(BuildContext context) {
    if (!isClockStart) {
      _start();
      isClockStart = true;
    }
    return tableWeights;
  }

  // ignore: non_constant_identifier_names, unused_element
  Widget TableOfWeights() {
    if (!isClockStart) {
      _start();
      isClockStart = true;
    }
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
                const DataColumn(label: Text('מיקום')),
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
                          MyData.weights.sort((productA, productB) =>
                              productB['weight_1']
                                  .compareTo(productA['weight_1']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          MyData.weights.sort((productA, productB) =>
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
                          MyData.weights.sort((weightA, weightB) =>
                              weightB['weight_2']
                                  .compareTo(weightA['weight_2']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          MyData.weights.sort((weightA, weightB) =>
                              weightA['weight_2']
                                  .compareTo(weightB['weight_2']));
                        }
                      });
                    }),
              ],
              rows: MyData.weights.map((item) {
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
