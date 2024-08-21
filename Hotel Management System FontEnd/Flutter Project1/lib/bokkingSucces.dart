import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigationdroar/adminnev.dart';

class BookingSuccess extends StatefulWidget {
  const BookingSuccess({super.key});

  @override
  State<BookingSuccess> createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:NavBar(),
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Booking Success'),
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
                image:AssetImage("images/eebb.png"),
                fit: BoxFit.fill,
              ),
            ),

          ),
        ),
      ),

    );
  }
}
