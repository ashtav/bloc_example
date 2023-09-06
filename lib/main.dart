import 'package:bloc_example/src/constants/theme.dart';
import 'package:fetchly/fetchly.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'src/routes/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LazyUi.init(alwaysPortrait: true);

  UseFetchly(
      baseUrl: 'https://dummyjson.com/',
      onRequest: (status, data) {
        logg('listen to request: $status');
      }).init();

  // Bloc.observer = const CounterObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Bloc Example',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      builder: (BuildContext context, Widget? widget) {
        double fontDeviceSize = MediaQuery.of(context).textScaleFactor;

        // prevent user from scaling font size
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: fontDeviceSize > 1.1 ? 1.1 : 1.0,
            ),
            child: LzToastOverlay(child: widget));
      },
    );
  }
}
