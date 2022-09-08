import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black, Colors.black87]
            )
          ),
          child: Column(
            children: [
              ClipPath(
                clipper: DiagonalPathClipperTwo(),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/img/logo_app.png',
                        width: 150,
                        height: 100,
                      ),
                      Text('Fácil y Rápido')
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'SELECCIONA TU ROL',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              SizedBox(height: 30),
              CircleAvatar(
                backgroundImage: AssetImage('assets/img/pasajero.png'),
                radius: 50,
                backgroundColor: Colors.grey[900],
              ),
              SizedBox(height: 10,),
              Text(
                'Cliente',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              SizedBox(height: 30),
              CircleAvatar(
                backgroundImage: AssetImage('assets/img/driver.png'),
                radius: 50,
                backgroundColor: Colors.grey[900],
              ),
              SizedBox(height: 10,),
              Text(
                'Conductor',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
