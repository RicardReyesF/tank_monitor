import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tank_monitor/src/widgets/radial_progress.dart';

class HomePage extends StatefulWidget {
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final double status=0.0;
  @override
  void initState() {
    readData(); 
    super.initState();
    
  }

  @override
  void dispose() { 

    super.dispose();
  }


  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: RadialPage(porcentaje: status,),
      ),
    );
  }

  Future<void> readData() async {
    databaseReference.child('Buscando').once().then((DataSnapshot snapshot) {
      String status = snapshot.value['001']['status'];
      print(status);
      if (status=="ocupado") {
          setState(() {
            
          }); 
        }
      print(snapshot.value);
    });
  }
}