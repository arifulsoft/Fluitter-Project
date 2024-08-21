import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navigationdroar/model_class/customar.dart';
import 'package:navigationdroar/model_class/ipaddress.dart';

List<Customar> objectsFromJson(String str) =>
    List<Customar>.from(json.decode(str).map((x) => Customar.fromJson(x)));

String objectsToJson(List<Customar> data) =>
    json.encode(List<Customar>.from(data.map((x) => x.tojson())));

class Searchid extends StatefulWidget {
  const Searchid({super.key});

  @override
  State<Searchid> createState() => _SearchidState();
}

class _SearchidState extends State<Searchid> {
  final Ipaddress _ipaddress = Ipaddress();
  final TextEditingController _nid = TextEditingController();
  List<Customar> _customers = [];

  Future<List<Customar>> showById(String nid) async {
    final response = await http.get(
      Uri.parse('${_ipaddress.Add}/search/$nid'),
    );

    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

  void showId() async {
    try {
      final customers = await showById(_nid.text);
      setState(() {
        _customers = customers;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search By NID"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _nid,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter NID';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'NID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_nid.text.isNotEmpty) {
                            showId();
                          }
                        },
                        child: Text("Search"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _customers.isEmpty
                ? Text("No data found")
                : DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Phone')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Room Number')),
              ],
              rows: _customers.map((customer) {
                return DataRow(cells: [
                  DataCell(Text(customer.name.toString())),
                  DataCell(Text(customer.phone.toString())),
                  DataCell(Text(customer.email.toString())),
                  DataCell(Text(customer.room_number.toString())),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
