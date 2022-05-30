import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitbitter/fitbitter.dart';



class PassiPage extends StatelessWidget {
  PassiPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'PassiPage';

  @override
  Widget build(BuildContext context) {
    print('${PassiPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passi'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('HomePage'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
        ],
      )),
    );
  } //build

} //Page