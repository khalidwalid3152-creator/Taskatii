

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:taskatti/core/features/home/widget/headerdate.dart';
import 'package:taskatti/core/features/home/widget/headerhome.dart';




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              headerhome(),
              Gap(20),
              Headerdate()
            ],
          ),
        ),
      ),
    );
  }
}
