import 'package:QuickWeather/view/home/home_sections/home_primary/home_primary_body.dart';
import 'package:QuickWeather/view/home/home_sections/home_primary/home_primary_fotter.dart';
import 'package:QuickWeather/view/home/home_sections/home_primary/home_primary_header.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  double height = 0;

  alterarAltura() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      height = 300; // Altura fixa
    } else {
      height = 0.0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 20, 25, 29),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 350),
              height: (screenHeight * 0.815) - height,
              width: screenWidth * 0.95,
              decoration: BoxDecoration(
                color: const Color.fromARGB(193, 19, 24, 74),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60), // raio fixo
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 350),
            width: screenWidth,
            height: (screenHeight * 0.80) - height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(123, 31, 203, 255),
                  spreadRadius: 1,
                  blurRadius: 50,
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF48C6EF), // topo
                  Color(0xFF3C99DC), // meio
                  Color(0xFF2F80ED),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              children: [
                AnimatedSwitcher(
                    duration: Duration(milliseconds: 850),
                    child: HomePrimaryHeader()),
                AnimatedSwitcher(
                    duration: Duration(milliseconds: 800),
                    child: HomePrimaryBody()),
                Spacer()
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1500),
                child: HomePrimaryFotter()),
          )
        ],
      ),
    );
  }
}
