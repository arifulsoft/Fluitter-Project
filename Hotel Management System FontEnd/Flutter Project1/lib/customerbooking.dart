import 'package:flutter/material.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:navigationdroar/Searchid.dart';
import 'package:navigationdroar/main.dart';
import 'package:navigationdroar/model_class/customar.dart';
import 'package:navigationdroar/model_class/ipaddress.dart';
import 'package:navigationdroar/payment.dart';

List<Customar> objectsFromJson(String str) =>
    List<Customar>.from(json.decode(str).map((x) => Customar.fromJson(x)));
String objectsToJson(List<Customar> data) =>
    json.encode(List<Customar>.from(data.map((x) => x.tojson())));

class Customerbooking extends StatefulWidget {
  const Customerbooking({super.key});

  @override
  State<Customerbooking> createState() => _CustomerbookingState();
}

class _CustomerbookingState extends State<Customerbooking> {
  Ipaddress _ipaddress=Ipaddress();
  TextEditingController _customar_id = TextEditingController();
  TextEditingController _indate = TextEditingController();
  TextEditingController _outdate = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _passport = TextEditingController();
  TextEditingController _nid = TextEditingController();
  TextEditingController _room_number = TextEditingController();
  String searchid = "";


  Future<Customar> singupStudent() async {
    Customar s = Customar(
        customar_id:0,
        indate: _indate.text,
        outdate: _outdate.text,
        name: _name.text,
        email: _email.text,
        phone: _phone.text,
        passport: _passport.text,
        nid: _nid.text,
        room_number: int.parse(_room_number.text),

    );


    final response = await http.post(
        Uri.parse(_ipaddress.Add+'/booking'),


        body: jsonEncode(s.tojson()),
        headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      return Customar.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _indate.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }Future<void> _selectDate2(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _outdate.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Apply For Booking"),
          centerTitle: true,
        ),
        body: Form(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[

                // Padding(
                //   padding: EdgeInsets.all(5),
                //   child: TextField(
                //     controller: _customar_id,
                //     decoration: InputDecoration(
                //       labelText: 'Customer Id',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _indate,
                    decoration: InputDecoration(
                      labelText: 'Checkin Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context),
                  ),
                ), Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _outdate,
                    decoration: InputDecoration(
                      labelText: 'CheckOut Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate2(context),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _passport,
                    decoration: InputDecoration(
                      labelText: 'Passport',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _nid,
                    decoration: InputDecoration(
                      labelText: 'NID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _room_number,
                    decoration: InputDecoration(
                      labelText: 'Room Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),



                ElevatedButton(
                  child: Text("Apply"),
                  onPressed: () async {
                    Customar st = await singupStudent();
                    if (_customar_id.text.length == 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePaymentScreen()));

                      // SnackBar snk =
                      // SnackBar(content: Text("Enter correct info"));
                      // ScaffoldMessenger.of(context).showSnackBar(snk);
                    }

                    // else if (_customar_id.text.length == 0) {
                    //   SnackBar snk =
                    //   SnackBar(content: Text("Enter correct info"));
                    //   ScaffoldMessenger.of(context).showSnackBar(snk);
                    // }

                  },

                ),
              ],
            ),
          ),
        ));
  }
}
