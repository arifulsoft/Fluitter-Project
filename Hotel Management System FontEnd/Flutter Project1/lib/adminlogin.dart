import 'package:flutter/cupertino.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:navigationdroar/adminnev.dart';
import 'package:navigationdroar/adminpage.dart';
import 'package:navigationdroar/adminregister.dart';
import 'package:navigationdroar/email.dart';
import 'package:navigationdroar/main.dart';
import 'package:navigationdroar/model_class/ipaddress.dart';
import 'package:navigationdroar/model_class/user.dart';


List<User> objectsFromJson(String str)=>List<User>.from(json.decode(str).map((x)=> User.fromJson(x)));
String objectsToJson(List<User> data)=>json.encode(List<User>.from(data).map((x)=>x.toJson()));
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Ipaddress _ipaddress=Ipaddress();
  TextEditingController _username=TextEditingController();
  TextEditingController _password=TextEditingController();
  Future<User> loginstudent() async{
    User s=User(username:_username.text, password: _password.text, email:"", role:"");

    final response=
    await http.post(
        Uri.parse(_ipaddress.Add+'/adminlogin'),

        body:jsonEncode(s.toJson()),
        headers: {"content-type":"application/Json"}
    );

    if(response.statusCode==200){
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
      return User.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Error");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Log in'),
      ),

      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children:<Widget>[

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_username ,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller:_password ,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),


             SizedBox(
               width: 50,

             child:   ElevatedButton(
                 style: ButtonStyle(

                   backgroundColor: WidgetStateProperty.all(Colors.green),
                 ),

                 child: Text('Login'),
                 onPressed: () async{
                   User s= await loginstudent();
                   if( s !=null && s.username==_username.text  && s.password==_password.text) {
                     // if(s.role=='admin'){
                     //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
                     // }else if(s.role=='Caustomar'){
                     //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                     // }
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));

                   }else{
                     SnackBar snk =SnackBar(content: Text('enter correct information'));
                     ScaffoldMessenger.of(context).showSnackBar(snk);
                   }
                 },
               ),
             ),

              SizedBox(
                height: 20,
              ),
              new SizedBox(
                width: 30,
                height: 40.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Rergister'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminregister()));

                  },
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
