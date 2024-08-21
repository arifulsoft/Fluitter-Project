import 'package:flutter/material.dart';
import 'package:navigationdroar/customerbooking.dart';
import 'package:navigationdroar/main.dart';
import 'package:navigationdroar/student.dart';


class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyEmail(),
    );
  }
}

class MyEmail extends StatefulWidget {
  const MyEmail({super.key});

  @override
  State<MyEmail> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyEmail> {
 List <Students> stlist=[
   Students("Single Room", " Room number:101 ", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5GLUF06AEkUf5LxLMcplL8Cm9z8ExlLhC_Q&s"),
   Students("Double Room","Room number:102 ","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3C2xjh_OFfoVCCpcfBvl7uq4TCa9IXN7VEg&s "),
   Students("Dulex Room", "Room number:103", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbBIfEn6WH8VdKWGPrlajoydjrGs2VHYfuqQ&s "),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Welcome to Room page'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: stlist.length,
        itemBuilder: (BuildContext context,int index){
        return Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.amber[100],
            child: SizedBox(
                width: 300,
                height: 500,
                child:Padding(
                  padding:EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[


                      Padding(
                        padding: EdgeInsets.all(20),
                        child:  Container(
                          width: 400,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:NetworkImage(stlist[index].photo.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),

                        ),
                      ),
                      // CircleAvatar(
                      //
                      //   radius: 100,
                      //
                      //   backgroundImage: NetworkImage(stlist[index].photo.toString()),
                      //
                      // ),

                      SizedBox(
                        height: 10,
                      ),
                      Text(stlist[index].name.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(stlist[index].details.toString(),style: TextStyle(fontSize: 20,color: Colors.black),

                      ),
                      Container(
                        child: Text(
                          "Bed configuration, extra bed options, air conditioning"
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget>[
                                    Text("Booking"),
                                  ],

                                ),
                              ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Customerbooking()));
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors.green),
                          ),
                        ),
                      ),

                    ],
                  ),
            ),

            ),
          ),
        );
        },

      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        tooltip: 'go home',
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
          // Navigator.pop(context); ( kaj kora ai ta )
        },
      ),
    );
  }
}
