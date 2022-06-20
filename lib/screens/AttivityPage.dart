import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AttivityPage extends StatelessWidget {
  AttivityPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'AttivityPage';

  @override
  Widget build(BuildContext context) {
    print('${AttivityPage.routename} built');
    final message = ModalRoute.of(context)!.settings.arguments as List?;
    final el1 = message![0];
    final el2 = message[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACTIVITY'),
        backgroundColor: Color.fromARGB(255, 18, 48, 124),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(
              child: Column(children: [
                Text('You got: '),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.directions_walk),
                        Text(
                          '$el2',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.local_fire_department),
                        Text(
                          '$el1',
                        ),
                      ],
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
                  content: Text('You did not reach the daily goal'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text('Get the prize'),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 18, 48, 124),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          )
        ],
      )),
    );
  } //build

} //Page