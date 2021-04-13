import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                        child: GestureDetector(
                          child: Image(
                            image: AssetImage("assets/home.png"),
                          ),
                          onTap: ()=>Navigator.pushNamed(context, 'home'),
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                        child: GestureDetector(
                          child: Image(
                            image: AssetImage("assets/contenedor.png"),
                          ),
                          onTap: ()=>Navigator.pushNamed(context, 'C1'),
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                        child: GestureDetector(
                          child: Image(
                            image: AssetImage("assets/caldera.png"),
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=>Navigator.pushNamed(context, 'C1T'),
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
                        child: GestureDetector(
                          child: Image(
                            image: AssetImage("assets/foco.png"),
                            fit: BoxFit.cover,
                          ),
                          onTap: ()=>Navigator.pushNamed(context, 'FC'),
                        ),
                      ),
                    ],
                  );
  }
}