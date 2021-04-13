import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tank_monitor/src/widgets/fondo_widget.dart';
import 'package:tank_monitor/src/widgets/header_widget.dart';
import 'package:tank_monitor/src/widgets/menu_widget.dart';


class FocoPage extends StatefulWidget {
  FocoPage({Key key}) : super(key: key);

  @override
  _FocoPageState createState() => _FocoPageState();
}
class _FocoPageState extends State<FocoPage> {
  
  @override
  void initState() { 
    super.initState();
    getLEDStatus();
  }
  final databaseReference = FirebaseDatabase.instance.reference();
  
  Color _color = Color.fromRGBO(255, 255, 255, 0.7);
  Color _color1 = Colors.orange;
  String _text= "OFF";
  int ledStatus = 0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                SizedBox(height: 5.0,),
                  Container(
                    width: 350.0,
                    height: 75.0,
                    child: Center(
                      child: Text("Encendido/Apagado",style: TextStyle(color: Colors.orange,fontSize: 25.0),)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Color.fromRGBO(255, 255, 255, 0.7)
                    ),
                  ),
                  SizedBox(height: 10.0),
                  MenuWidget(),
                  SizedBox(height: 30.0,),
                  Container(
                    width: 350.0,
                    height: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: _color
                    
                    ),
                    child: RaisedButton(
                    onPressed: _estado,
                    child: Center(
                      child: Text(ledStatus == 1 ? 'ON' : 'OFF',style: TextStyle(fontSize: 50.0,color: _color1),),
                    ),
                  ) 
                )
              ],
            ),
          )
        ],
      ),
    ); 
  }

     void _estado(){
       if(ledStatus==0){
         setState(() {
           ledStatus=1;
           databaseReference.child('Foco').child('001').set({
             'estado': 1
           });
           _color   = Colors.orange;
           _text    = "OFF";
           _color1  = Colors.orange;
         });
       }else{
         setState(() {
           ledStatus=0;
           databaseReference.child('Foco').child('001').set({
             'estado': 0
           });
           _color   = Color.fromRGBO(255, 255, 255, 0.7);
           _text    = "ON";
           _color1  = Colors.grey;
         });
       }
      }

  getLEDStatus() async {
  await databaseReference.child('Foco').child('001').once().then((DataSnapshot snapshot) {
    ledStatus = snapshot.value['estado'];
    print("estado ${ledStatus.toString()}");
  });

  }
}

//SSID moto g(9) plus 7210
//PASSWORD 87abafb639de