import 'package:flutter/material.dart';
import 'package:wearable_project/Training.dart';

class PrizePage extends StatelessWidget {
  PrizePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'PrizePage';
  
  @override
  Widget build(BuildContext context) {
    print('${PrizePage.routename} built');
    final message = ModalRoute.of(context)!.settings.arguments as String;
    final train=message;
    return Scaffold(
      appBar: AppBar(
        title: Text(PrizePage.routename),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(train)
      ),
    );
  } //build

} //Page