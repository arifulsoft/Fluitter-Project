import 'package:flutter/material.dart';
import 'package:navigationdroar/bokkingSucces.dart';


class CreatePaymentScreen extends StatefulWidget {
  @override
  _CreatePaymentScreenState createState() => _CreatePaymentScreenState();

}

class _CreatePaymentScreenState extends State<CreatePaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _patientIdController = TextEditingController(text: '102');
  final _nameController = TextEditingController(text: 'arif');
  final _ageController = TextEditingController(text: 'arif@gmail.com');
  final _phoneController = TextEditingController(text: '01789639995');
  final _consultationFeeController = TextEditingController(text: '1000');
  final _perDayBedChargeController = TextEditingController();
  final _totalBedChargeController = TextEditingController();
  final _medicineBillController = TextEditingController(text: '500');
  final _testBillController = TextEditingController();
  final _totalAmountController = TextEditingController();
  final _discountController = TextEditingController();
  final _netAmountController = TextEditingController();
  String? _selectedGender = 'Male';
  String? g;
  get crossAxisAlignment => null;



  @override
  void initState() {
    super.initState();
    _consultationFeeController.addListener(_updateNetAmount);
    _totalBedChargeController.addListener(_updateNetAmount);
    _medicineBillController.addListener(_updateNetAmount);
    _testBillController.addListener(_updateNetAmount);
    _discountController.addListener(_updateNetAmount);
  }

  @override
  void dispose() {
    _patientIdController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _consultationFeeController.dispose();
    _perDayBedChargeController.dispose();
    _totalBedChargeController.dispose();
    _medicineBillController.dispose();
    _testBillController.dispose();
    _totalAmountController.dispose();
    _discountController.dispose();
    _netAmountController.dispose();
    super.dispose();
  }

  void _updateNetAmount() {
    final consultationFee = double.tryParse(_consultationFeeController.text) ?? 0.0;
    // final totalBedCharge = double.tryParse(_totalBedChargeController.text) ?? 0.0;
    final medicineBill = double.tryParse(_medicineBillController.text) ?? 0.0;
    // final testBill = double.tryParse(_testBillController.text) ?? 0.0;
    // final discount = double.tryParse(_discountController.text) ?? 0.0;

    final netAmount = consultationFee + medicineBill ;
    _netAmountController.text = netAmount.toStringAsFixed(2);
    // final netAmount = consultationFee + totalBedCharge + medicineBill + testBill - discount;
    // _netAmountController.text = netAmount.toStringAsFixed(2);
  }

  void _createPayment() async {
    if (_formKey.currentState!.validate()) {
      final payment = Payment(
        id: 0, // Assuming 'id' is auto-incremented in the backend
        patientId: int.parse(_patientIdController.text),
        patientName: _nameController.text,
        age: int.parse(_ageController.text),
        phone: _phoneController.text,
        consultationFee: double.parse(_consultationFeeController.text),
        dateFrom: DateTime.now(), // Replace with actual data as needed
        dateTo: DateTime.now(), // Replace with actual data as needed
        perDayBedCharge: double.parse(_perDayBedChargeController.text),
        totalBedCharge: double.parse(_totalBedChargeController.text),
        medicineBill: double.parse(_medicineBillController.text),
        testBill: double.parse(_testBillController.text),
        totalAmount: double.parse(_totalAmountController.text),
        discount: double.parse(_discountController.text),
        netAmount: double.parse(_netAmountController.text),
        paymentDate: DateTime.now(),
      );

      try {
        final newPayment = await ApiService().createPayment(payment);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment created: ${newPayment.patientName}')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create payment: $e')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          
          key: _formKey,
          
          child: ListView(
            children: <Widget>[

              TextFormField(
                controller: _patientIdController,
                decoration: InputDecoration(labelText: 'Room Number'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Customar Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _consultationFeeController,
                decoration: InputDecoration(labelText: 'Room Rent'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter consultation fee';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   controller: _perDayBedChargeController,
              //   decoration: InputDecoration(labelText: 'Per Day Bed Charge'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter per day bed charge';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _totalBedChargeController,
              //   decoration: InputDecoration(labelText: 'Total Bed Charge'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter total bed charge';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                controller: _medicineBillController,
                decoration: InputDecoration(labelText: 'Service Bills'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter medicine bill';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   controller: _testBillController,
              //   decoration: InputDecoration(labelText: 'Test Bill'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter test bill';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _totalAmountController,
              //   decoration: InputDecoration(labelText: 'Total Amount'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter total amount';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _discountController,
              //   decoration: InputDecoration(labelText: 'Discount'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter discount';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                controller: _netAmountController,
                decoration: InputDecoration(labelText: 'Net Amount'),
                keyboardType: TextInputType.number,
                readOnly: true,
              ),

          ListTile(
             title:Text('Bikash (01789693335)'),
           leading:  Radio <String>(value: 'femal', groupValue: g, onChanged: (String? value){
              setState(() {
                g=value;

              });
            }),
          ),



              TextFormField(

                decoration: InputDecoration(labelText: 'Trunjection  Id'),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Trunjection  id';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                // onPressed: _createPayment,
                // child: Text('Create Payment'),
                onPressed: () {
                  {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingSuccess()));

                  }
                }, child: Text('Create Payment'),


              ),

            ],
          ),
        ),
      ),
    );
  }

  ApiService() {}

  Payment({required int id, required int patientId, required String patientName, required int age, required String phone, required double consultationFee, required DateTime dateFrom, required DateTime dateTo, required double perDayBedCharge, required double totalBedCharge, required double medicineBill, required double testBill, required double totalAmount, required double discount, required double netAmount, required DateTime paymentDate}) {}
}

void main() {
  runApp(MaterialApp(
    home: CreatePaymentScreen(),
  ));
}
