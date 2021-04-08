import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotones(context,'Contenedor 1','assets/contenedor.png','C1'),
            _crearBotones(context,'Contenedor 2','assets/contenedor.png',''),
          ],
        ),
        TableRow(
          children: [
            _crearBotones(context,'Contenedor 3','assets/contenedor.png',''),
            _crearBotones(context,'Contenedor 4','assets/contenedor.png',''),
          ],
        ),
        
        TableRow(
          children: [
            _crearBotones(context,'Caldera 1','assets/caldera.png',''),
            _crearBotones(context,'Caldera 2','assets/caldera.png',''),
          ],
        ),
        
      ],

    );
  }

  Widget _crearBotones(BuildContext context, String text, String imagen, String ruta ){
    return Padding(
          padding: EdgeInsets.all(0.0),
          child: GestureDetector(
            onTap: ()=>Navigator.pushNamed(context,ruta),
          child: ClipRRect(
            child: BackdropFilter(
            filter:ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0) ,
            child: Container(
            height: 180.0,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.7), 
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(  
              children: <Widget>[
              SizedBox(height: 25.0,),
              Container(
                width: 90.0,
                height: 90.0,
                child: Image(image: AssetImage(imagen))
              ),
            SizedBox(height: 35.0),
            Text(text,style: TextStyle(color: Colors.orange,fontSize: 20.0),)
              ],
            ),
          ),
        ),
      ),
    )
  );
}
}