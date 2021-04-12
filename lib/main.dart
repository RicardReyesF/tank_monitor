import 'package:flutter/material.dart';
import 'package:tank_monitor/src/pages/caldera_1_page.dart';
import 'package:tank_monitor/src/pages/contenedor_1_page.dart';
import 'package:tank_monitor/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'C1'  : (BuildContext context) => Contenedor_1Page(),
        'C1T' : (BuildContext context) => Cl1Page(),
      }
    );
  }
}