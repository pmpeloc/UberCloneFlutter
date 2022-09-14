import 'package:flutter/material.dart';

class DriverMapPage extends StatefulWidget {
  const DriverMapPage({Key? key}) : super(key: key);

  @override
  State<DriverMapPage> createState() => _DriverMapPageState();
}

class _DriverMapPageState extends State<DriverMapPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Mapa del Conductor')),
    );
  }
}
