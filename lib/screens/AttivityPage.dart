import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AttivityPage extends StatelessWidget {
  AttivityPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'AttivityPage';

  @override
  Widget build(BuildContext context) {
    print('${AttivityPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attività'),
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