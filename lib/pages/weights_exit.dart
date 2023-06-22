import 'package:flutter/material.dart';
import 'weights.dart';

class WeightsExitPage extends StatefulWidget {
  const WeightsExitPage({super.key});

  @override
  State<WeightsExitPage> createState() => _WeightsExitPageState();
}

class _WeightsExitPageState extends State<WeightsExitPage> {
  @override
  Widget build(BuildContext context) {
    return tableWeights;
  }
}

/* return Scaffold(
      appBar: AppBar(title: const Text('משקלים שער יציאה ')),
      body: const Center(
        child: Text("בהכנה"),
      ),
    ); */