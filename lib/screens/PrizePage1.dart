// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wearable_project/main.dart';

class PrizePage1 extends StatelessWidget {
  PrizePage1({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'PrizePage1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 166, 24, 24),
        centerTitle: true,
        elevation: 10,
        title: Text('BASIC LEVEL TRAINING'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.squarespace-cdn.com/content/v1/61242b9d53db5e1fe7c46015/1636526961864-RYFHUP0V7N5S4H53ZA2F/106110577_3323464567674623_616773824457991780_n.jpg?format=1500w'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(100, 22, 44, 33),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'WARMING UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Double Crunch                                  3x20 \nInverse Cruch on fitball                   3x20 \nPlank on elbows                               3x30sec \nBench Press at Multipower            3x15',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'TRAINING FORM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Bench Press at Multipower        3x15 \nPectoral Machine                         3x12 \nIncline Bench                                3x12 \nWide Lat Machine                        3x12 \nDumbell Curls            3x12',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'COOL DOWN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Chest Stretching                         1min \nTriceps Stretching                      1min \nShoulders Circles                       1min',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
