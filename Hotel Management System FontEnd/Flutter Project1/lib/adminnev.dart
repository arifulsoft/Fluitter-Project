import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigationdroar/bookingshowdata.dart';
import 'package:navigationdroar/main.dart';
import 'package:navigationdroar/showorder.dart';


class NavBar extends StatelessWidget{

  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Admin'),
            accountEmail: Text('abc@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/download.png'),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(image: AssetImage('images/adminpic.jpg'),fit: BoxFit.cover)
            ),
          ),

          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text('Upload Shot'),
            onTap: ()=>print('Upload tapped'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Customar details'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>bookingshowdata()));
            },
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Order Show'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowOrder()));
            },
          ),

        ],
      ),
    );
  }

}