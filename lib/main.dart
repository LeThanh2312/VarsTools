import 'package:flutter/material.dart';
import 'package:varstools/routes.dart';
import 'package:varstools/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:varstools/utilities/constant.dart';
import 'package:varstools/utilities/extensions/enum/tab_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    contextMain = context;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          routes: Routes.routes,
          home:  const BottomBarMainScreen(indexTabItem: TabItem.home) ,
        );
      },
    );
  }
}