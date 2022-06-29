// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class AttivityPage extends StatelessWidget {
  AttivityPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'AttivityPage';

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as List?;
    final el1 = message![0]; //calories
    final el2 = message[1]; //steps
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Summary of the Day'),
        backgroundColor: Color.fromARGB(255, 166, 24, 24),
      ),
      body: Center(
          child: Container(
        color: Color.fromARGB(255, 0, 74, 173),
        padding: const EdgeInsets.all(12),
        child: Card(
          color: Color.fromARGB(255, 217, 214, 214),
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Container(
                  child: Column(children: [
                    Text(
                      'You got: ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 74, 173),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 74, 173),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions_walk,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  '$el2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 74, 173),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Text(
                                  '$el1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (el2 >= 5000 || el1 >= 3000) {
                    if (el2 > 5000 && el2 < 10000) {
                      Navigator.pushNamed(context, 'PrizePage1');
                    } else if (el2 >= 10000 && el2 < 15000) {
                      Navigator.pushNamed(context, 'PrizePage2');
                    } else if (el2 >= 15000) {
                      Navigator.pushNamed(context, 'PrizePage3');
                    }
                  } else {
                    final snackBar = SnackBar(
                      backgroundColor: Color.fromARGB(255, 166, 24, 24),
                      content: Text('You did not reach the daily goal'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text(
                  'Get the prize',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Color.fromARGB(255, 0, 74, 173),
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              )
            ],
          ),
        ),
      )),
    );
  } //build

} //Page