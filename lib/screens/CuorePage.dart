import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CuorePage extends StatelessWidget {
  CuorePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'CuorePage';

  @override
  Widget build(BuildContext context) {
    print('${CuorePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battiti'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('HomePage'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          )
        ],
      )),
    );
  } //build

} //Page