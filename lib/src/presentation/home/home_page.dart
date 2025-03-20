import 'package:flutter/material.dart';
import 'package:konfio_challenge/src/presentation/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar().customApp(size),
    );
  }
}
