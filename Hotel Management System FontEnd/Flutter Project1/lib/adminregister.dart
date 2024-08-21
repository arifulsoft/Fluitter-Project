import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:navigationdroar/main.dart';
import 'package:navigationdroar/model_class/ipaddress.dart';
import 'package:navigationdroar/model_class/user.dart';



List<User> objectsFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String objectsToJson(List<User> data) =>
    json.encode(List<User>.from(data.map((x) => x.toJson())));

class Adminregister extends StatefulWidget {
  const Adminregister({super.key});

  @override
  State<Adminregister> createState() => _AdminregisterState();
}

class _AdminregisterState extends State<Adminregister> {
  Ipaddress _ipaddress=Ipaddress();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _role = TextEditingController();

  String? dd = "manager";

  Future<User> singupStudent() async {
    User s = User(

        username: _username.text,
        email: _email.text,
        password: _password.text,
        role:dd,
        // role: _role.text,

        );

    final response = await http.post(
        Uri.parse(_ipaddress.Add+'/singUp'),

        body: jsonEncode(s.toJson()),
        headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Register"),
          centerTitle: true,
        ),
        body: Form(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[



                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                      labelText: 'Username',
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
                    controller: _password,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(5),
                //   child: TextField(
                //     controller: _role,
                //     decoration: InputDecoration(
                //       labelText: 'Role',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //     ),
                //   ),
                // ),

                Row(
                  children: [
                    DropdownButton(
                        value: dd,
                        items: <DropdownMenuItem<String>>[

                          DropdownMenuItem<String>(
                            child: Text("Manager"),
                            value: "manager",
                          ),
                          DropdownMenuItem<String>(
                            child: Text("Admin"),
                            value: "admin",
                          ),
                          DropdownMenuItem<String>(
                            child: Text("Cashier"),
                            value: "cashier",
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            dd = value;
                            //SnackBar s = SnackBar(content: Text(dd.toString()));

                            //ScaffoldMessenger.of(context).showSnackBar(s);
                          });
                        }),
                  ],
                ),


                // Row(
                //   children: [
                //     DropdownButton(
                //         value: dd,
                //         items: <DropdownMenuItem <String>>[
                //           DropdownMenuItem <String>(
                //             child:Text("Admin"),
                //             value: "admin",
                //           ),
                //           DropdownMenuItem <String>(
                //             child:Text("Customar"),
                //             value: "customar",
                //           ),
                //
                //         ],
                //         onChanged: (String? value){
                //           setState(() {
                //             dd=value;
                //             // var snackBar = SnackBar(content: Text(dd.toString()));
                //             // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //           });
                //         }
                //     ),
                //   ],
                // ),


                ElevatedButton(
                  child: Text("SignUp"),
                  onPressed: () async {
                    User st = await singupStudent();
                    if (st != null) {
                      SnackBar snk =
                      SnackBar(content: Text("Register success"));
                      ScaffoldMessenger.of(context).showSnackBar(snk);
                    }


                  },

                ),
              ],
            ),
          ),
        ));



  }
}
