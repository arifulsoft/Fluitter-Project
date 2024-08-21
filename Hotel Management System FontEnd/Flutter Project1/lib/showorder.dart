
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:navigationdroar/model_class/ipaddress.dart';
import 'package:navigationdroar/model_class/order.dart';


List<Order> objectsFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));
String objectsToJson(List<Order> data) =>
    json.encode(List<Order>.from(data).map((x) => x.tojson()));

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:ShowOrder(),
  ),
  );
}

class ShowOrder extends StatefulWidget {
  const ShowOrder({super.key});

  @override
  State<ShowOrder> createState() => _ShowOrderState();
}

class _ShowOrderState extends State<ShowOrder> {
  // late List<Applyuseraccount> _alldata=[];
  Ipaddress _ipaddress=Ipaddress();

  Future<List<Order>> showallapplication() async {
    final response =
    await http.get(Uri.parse(_ipaddress.Add+'/odershowall'));

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
        title: Text('Customar food order Details'),
        backgroundColor: Colors.green,
      ),
      body:ListView(
        children: [
          Container(
            height:700,
            child: FutureBuilder<List<Order>>(
              future: showallapplication(),
              builder: (context, snapshot) {
                // _alldata=snapshot.data!;
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext  context, index) {
                      return Center(
                        child: Card(
                          elevation: 50,
                          shadowColor: Colors.red,
                          color: Colors.orangeAccent,
                          child: SizedBox(
                            width: 350,
                            height: 280,
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                children:<Widget>[
                                  SizedBox(height:5),
                                  Text(
                                    'Customar id : '+snapshot.data![index].c_id.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Food type : '+snapshot.data![index].f_type.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Food Menu : '+snapshot.data![index].f_menu.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Amount : '+snapshot.data![index].amount.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),

                                  SizedBox(height:5),
                                  Text(
                                    'Date : '+snapshot.data![index].date.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
