import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:navigationdroar/customerbooking.dart';
import 'package:navigationdroar/model_class/customar.dart';
import 'package:flutter/src/material/data_table.dart';
import 'package:navigationdroar/model_class/ipaddress.dart';


List<Customar> objectsFromJson(String str) =>
    List<Customar>.from(json.decode(str).map((x) => Customar.fromJson(x)));
String objectsToJson(List<Customar> data) =>
    json.encode(List<Customar>.from(data).map((x) => x.tojson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

  ),
  );
}

class bookingshowdata extends StatefulWidget {
  const bookingshowdata({super.key});

  @override
  State<bookingshowdata> createState() => _bookingshowdataState();
}

class _bookingshowdataState extends State<bookingshowdata> {
  Ipaddress _ipaddress=Ipaddress();
  Future<List<Customar>> bookingshowdata() async {
    final response =
    await http.get(Uri.parse(_ipaddress.Add+'/bookingshow'));

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text('Costomar Booking Data'),
        backgroundColor: Colors.lightGreen,
      ),
       body: ListView(
         children: [
          SizedBox(

            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:  Container(
                height: 400,
                width: 100,
               child: FutureBuilder<List<Customar>>(
                  future: bookingshowdata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Customar> customers = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(

                           columns: [
                             DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Phone')),
                             DataColumn(label: Text('NID')),
                              DataColumn(label: Text('Room Number')),
                           ],
                           rows: customers.map((customer) {
                             return DataRow(cells: [
                                DataCell(Text(customer.name.toString())),
                               DataCell(Text(customer.phone.toString())),
                               DataCell(Text(customer.nid.toString())),
                                DataCell(Text(customer.room_number.toString())),
                              ]);
                            }).toList(),
                          ),
                       ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error");
                  } else {
                      return CircularProgressIndicator();
                    }
                  },
               ),
              ),
            ),
          ),
         ],

      ),

    );

  }
}
