// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wearable_project/main.dart';

class PrizePage3 extends StatelessWidget {
  PrizePage3({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'PrizePage3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 166, 24, 24),
        centerTitle: true,
        elevation: 10,
        title: Text('EXPERT LEVEL TRAINING '),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://d3h9ln6psucegz.cloudfront.net/wp-content/uploads/2017/11/6-Reasons-You-Should-Never-Open-a-Gym.jpg'),
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
                          'Crunch legs at the top and touch toes 3x30 \nFull Crunch 3x30 \nLateral plank on the elbows alternating 4x30sec \nPush-ups 3x20',
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
                          '''Free flat bench with dumbbells 3x8 + 1 strip. \nBench opening at 30° 3x10 + 1 strip.
Free inclined bench 3x8-8-6 + 1 strip.
Free flat bench 2x25
Traction with overload 3x exhaustion
Lat machine wide 3x8 + 1 strip.
Curl with alternating dumbbells 3x8 + 1 strip.
Concentrated curl with 1 seated dumbbell 3x8 + 1 strip.
Rowing with barbell 3x8 + 1 strip.
''',
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
                          'Chest Stretching         1min \nTriceps Stretching      1min \nShoulders Circles       1min \nBiceps Stretching       1min',
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
