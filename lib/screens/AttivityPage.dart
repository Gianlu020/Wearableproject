import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wearable_project/Training.dart';

class AttivityPage extends StatelessWidget {
  AttivityPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'AttivityPage';

  @override
  Widget build(BuildContext context) {
    print('${AttivityPage.routename} built');
    final message = ModalRoute.of(context)!.settings.arguments as List?;
    final el1=message![0];
    final el2=message[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attività'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ecco il numero di calorie $el1 , ed i passi $el2'),
          ElevatedButton(
            onPressed: () {
              if(el2>=5000 || el1>=3000){
                if(el2>5000 && el2<10000){
                  final text=Allenamenti[0];
                  Navigator.pushNamed(context, 'PrizePage',arguments: text );
                }else if( el2>=10000 && el2<15000){
                  final text=Allenamenti[1];
                  Navigator.pushNamed(context, 'PrizePage',arguments: text );
                }else if (el2>=15000){
                  final text=Allenamenti[2];
                  Navigator.pushNamed(context, 'PrizePage',arguments: text );
                }
              }
              else{
               final snackBar= SnackBar(content: Text('You did not reach the daily goal'),action: SnackBarAction(
              label: 'Undo',onPressed: (){},),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text('Get the prize'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          )
        ],
      )),
    );
  } //build

} //Page