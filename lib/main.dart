import 'dart:developer';

import 'package:batterylevel/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Controller())],
    child: MaterialApp(
      home: MyHomePage(),
    ),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (context, provider, child) {
      return Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  log(provider.batteryLevels);
                  provider.getBatteryLevel();
                },
                child: const Text('Get Battery Level'),
              ),
              Text(provider.batteryLevels),
            ],
          ),
        ),
      );
    });
  }
}
