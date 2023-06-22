import 'package:flutter/material.dart';
import 'weights.dart';

class WeightsAllPage extends StatefulWidget {
  const WeightsAllPage({super.key});

  @override
  State<WeightsAllPage> createState() => _WeightsAllPageState();
}

class _WeightsAllPageState extends State<WeightsAllPage> {
  @override
  Widget build(BuildContext context) {
    return tableWeights;
  }
}
