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
           ElevatedButton(
            onPressed: ()async {
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: '238C6C',
                    clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
                    type: 'steps',
                  );
                  final stepsData = await fitbitActivityTimeseriesDataManager
                      .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                    date: DateTime.now().subtract(Duration(days: 3)),
                    userID: '7ML2XV',
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;
            },
            child: const Text('Fetch Data'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          )
        ],
      )),
    );
  } //build

} //Page