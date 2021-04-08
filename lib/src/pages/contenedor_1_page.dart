import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tank_monitor/src/widgets/fondo_widget.dart';
import 'package:tank_monitor/src/widgets/header_widget.dart';
import 'package:tank_monitor/src/widgets/radial_progress.dart';

class Contenedor_1Page extends StatefulWidget {
  

  @override
  _Contenedor_1PageState createState() => _Contenedor_1PageState();
}

class _Contenedor_1PageState extends State<Contenedor_1Page> {
  double status1=0.0;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Fondo(),
          Column(
            children: [
              SafeArea(
                  child: Container(
                    height: 200.0,
                    width: double.infinity,
                    child: HeaderCurve(),
                  ),
                ),
                SizedBox(height: 100.0,),
                Container(
                  width: 350.0,
                  height: 350.0,
                  child: RadialPage(porcentaje: status1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Color.fromRGBO(255, 255, 255, 0.7)
                  ),
                )
                
            ],
          )        
        ]
      )
    );
  }

  Future<void> readData() async {
    databaseReference.child('Distancia').once().then((DataSnapshot snapshot) {
      double status = snapshot.value['001']['distancia'];
      setState(() {
        status1 = status;
      });
    });
  }
}