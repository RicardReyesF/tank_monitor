import 'package:flutter/material.dart';


class HeaderCurve extends StatefulWidget {

  @override
  _HeaderCurveState createState() => _HeaderCurveState();
}

class _HeaderCurveState extends State<HeaderCurve> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        child: Container(
          padding: EdgeInsets.only(top: 100.0,left: 130.0),
          child: Text("Monitoreo",style: TextStyle(color: Color.fromRGBO(200, 160, 78, 1.0),fontSize: 35.0 ),)
        ),
        painter: _HeaderC(),
      ),
    );
  }
}


class _HeaderC extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final lapiz = new Paint();
      lapiz.color = Color.fromRGBO(255, 255, 255, 0.7);
      lapiz.strokeWidth = 2;
      lapiz.style = PaintingStyle.fill;

      final linea = new Path();
      linea.lineTo(0,size.height * 0.95);
      linea.quadraticBezierTo(size.width, size.height * 0.95, size.width,size.height * 0.80);
      //linea.quadraticBezierTo(size.width * 0.66, size.height * 0.15, size.width,size.height * 0.25);
      linea.lineTo(size.width, 0);
      


      canvas.drawPath(linea,lapiz);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}