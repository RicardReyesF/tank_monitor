import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tank_monitor/src/widgets/button_widget.dart';
import 'package:tank_monitor/src/widgets/fondo_widget.dart';
import 'package:tank_monitor/src/widgets/header_widget.dart';
import 'package:tank_monitor/src/widgets/radial_progress.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double status1=0.0;
  @override
  void initState() {
     
    super.initState();
    
  }

  @override
  void dispose() { 

    super.dispose();
  }


  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      body: Stack( 
        children: <Widget>[
          Fondo(),
          
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                height: 450.0,
                width: double.infinity,
                child: HeaderCurve(),
                ),
                ButtonWidget()
              ],
            ),
          )
              ],
            ),    
        //child: RadialPage(porcentaje: status1,)
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



