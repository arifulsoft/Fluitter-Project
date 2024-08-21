class Order {
  int? s_number;
  int? c_id;
  String? f_type;
  String? f_menu;
  double? amount;
  String? date;


  Order(
      { required this.s_number,
        required this.c_id,
        required this.f_type,
        required this.f_menu,
        required this.amount,
        required this.date,
        });
  factory Order.fromJson(Map<String, dynamic> json) => Order(
      s_number: json['s_number'],
      c_id: json['c_id'],
      f_type: json['f_type'],
      f_menu: json['f_menu'],
    amount: json['amount'],
      date: json['date'],


  );
  Map<String, dynamic> tojson() {
    return {"s_number": s_number, "c_id": c_id, "f_type": f_type, "amount":amount, "date": date};
  }
}