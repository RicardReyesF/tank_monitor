import 'dart:math';

import 'package:flutter/material.dart';

class RadialPage extends StatefulWidget {
final porcentaje;

  const RadialPage({ this.porcentaje});

  @override
  _RadialPageState createState() => _RadialPageState();
}


class _RadialPageState extends State<RadialPage> with SingleTickerProviderStateMixin{
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() { 
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
      vsync: this, duration: Duration(milliseconds: 300)
    );
    
    super.initState();
    
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final difereciaAnimar= widget.porcentaje -porcentajeAnterior;
    porcentajeAnterior= widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){
        return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
      painter: _RadialPaint((widget.porcentaje-difereciaAnimar) + (difereciaAnimar * controller.value)),
      child: Center(
        
        child: Text((((widget.porcentaje)/180)*100).round().toString() + "%",style: TextStyle(color: Colors.orange,fontSize: 75.0),),
      )
      )
    );
  }
    );
  }
}

class _RadialPaint extends CustomPainter{

  final porcentaje;

  _RadialPaint(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

        


      final paint = new Paint();
      paint.color = Colors.grey;
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 4;

      Offset center = Offset(size.width * 0.5,size.height * 0.5);

      double radius = min(size.width * 0.5,size.height * 0.5);

      canvas.drawCircle(center, radius, paint);

      print("el porcentaje es " + "${porcentaje.toString()}");
      ///relleno del arco
      double angleArc= 2 * pi * (porcentaje / 180);

      final paintArc        = new Paint();
      paintArc.color        = Colors.orange;
      paintArc.strokeWidth  = 10;
      paintArc.style        = PaintingStyle.stroke;

      canvas.drawArc(
        Rect.fromCircle(center: center,radius:radius), 
        -pi/2, 
        angleArc, 
        false, 
        paintArc);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}