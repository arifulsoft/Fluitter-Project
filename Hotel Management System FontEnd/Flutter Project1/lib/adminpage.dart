import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigationdroar/adminnev.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:NavBar(),
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Welcome to Admin Page'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child:  Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage("images/adminpic.jpg"),
                fit: BoxFit.fill,
              ),
            ),

          ),
        ),
      ),

    );
  }
}
