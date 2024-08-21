import 'package:flutter/material.dart';
import 'package:navigationdroar/Searchid.dart';
import 'package:navigationdroar/bookingshowdata.dart';
import 'package:navigationdroar/email.dart';
import 'package:navigationdroar/nextpage.dart';
import 'package:navigationdroar/payment.dart';
import 'package:navigationdroar/phone.dart';
import 'package:navigationdroar/adminlogin.dart';
import 'package:navigationdroar/showorder.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------------- navigation drawer -----------------

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ariful Islam'),
              accountEmail: Text('arifulhc@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('images/rt.jpg'),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/adminpic.jpg'),
                      fit: BoxFit.cover)),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Next Page'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>YourWidget()));
              },
            ),

            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text('Admin Login'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
            ),

            ListTile(
              leading: Icon(Icons.call),
              title: Text('Phone'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Phone()));
              },
            ),

            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Email()));
              },
            ),



            ListTile(
              leading: Icon(Icons.roundabout_right),
              title: Text('About'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
            ),

          ],
        ),
      ),

      // ---------------------- app bar-----------------

      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Hotel management system'),
        backgroundColor: Colors.indigoAccent,
      ),

      // ---------------------- body -----------------

      body: Column(
        children: [
            Padding(
                padding: EdgeInsets.all(20),
               child:  Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage("images/booking.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),

              ),
            ),


          Expanded(
              child: GridView.count(
                  crossAxisCount:3,
                      padding:EdgeInsets.all(20),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                primary: false,
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.purple,
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Icon(
                                  Icons.admin_panel_settings,size: 30),
                                Text("Admin",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>bookingshowdata()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.teal,
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Icon(
                                    Icons.hotel,size: 30),
                                Text("Booking",style: TextStyle(fontSize: 15,color: Colors.white),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Email()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.deepPurple,
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Icon(
                                    Icons.bed_rounded,size: 30),
                                Text("Rooms",style: TextStyle(fontSize: 20,color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.blue,
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Icon(
                                    Icons.room_service,size: 30),
                                Text("Sevice",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowOrder()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Icon(
                                    Icons.explore,size: 30),
                                Text("COnfirm Room",style: TextStyle(fontSize: 10),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchid()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.fromSize(
                      size: Size(80,80),
                      child: ClipOval(
                        child: Material(
                          color: Colors.deepOrange,
                          child: InkWell(
                            splashColor: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Icon(
                                    Icons.email,size: 30),
                                Text("Contuct",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePaymentScreen()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],

      ),

      // ---------------------- floating action button -----------------

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        tooltip: 'go next page',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => YourWidget()));
        },
      ),
    );
  }
}
