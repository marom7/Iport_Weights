import 'package:flutter/material.dart';
import 'weights.dart';

class WeightsEntrencePage extends StatefulWidget {
  const WeightsEntrencePage({super.key});

  @override
  State<WeightsEntrencePage> createState() => _WeightsEntrencePageState();
}

class _WeightsEntrencePageState extends State<WeightsEntrencePage> {
  @override
  Widget build(BuildContext context) {
    return tableWeights;
  }
}
