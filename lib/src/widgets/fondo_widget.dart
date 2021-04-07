import 'package:flutter/material.dart';

class Fondo extends StatelessWidget {
  const Fondo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
    begin: FractionalOffset(0.0 , 0.6),
    end: FractionalOffset(0.0 , 1.0),
    colors: [
      Color.fromRGBO(244, 178, 112, 1.0),
      Color.fromRGBO(200, 160, 78, 1.0)
    ]
        )
      ),
    );
  }
}