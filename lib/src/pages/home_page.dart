import 'package:flutter/material.dart';
import 'package:tank_monitor/src/widgets/button_widget.dart';
import 'package:tank_monitor/src/widgets/fondo_widget.dart';
import 'package:tank_monitor/src/widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack( 
        children: <Widget>[
          Fondo(),
          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    height: 200.0,
                    width: double.infinity,
                    child: HeaderCurve(),
                  ),
                ),
                SizedBox(height: 25.0),
                ButtonWidget()
              ],
            ),
          )
              ],
            ),
    );
  }
}



