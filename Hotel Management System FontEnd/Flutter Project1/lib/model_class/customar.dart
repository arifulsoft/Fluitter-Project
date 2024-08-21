class Customar {
  int? customar_id;
  String? indate;
  String? outdate;
  String? name;
  String? email;
  String? phone;
  String? passport;
  String? nid;
  int? room_number;

  Customar(
      { this.customar_id,
        required this.indate,
        required this.outdate,
        required this.name,
        required this.email,
        required this.phone,
        required this.passport,
        required this.nid,
        required this.room_number,


      });
  factory Customar.fromJson(Map<String, dynamic> json) => Customar(
      customar_id: json['customar_id'],
    indate: json['indate'],
    outdate: json['outdate'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      passport: json['passport'],
      nid: json['nid'],
      room_number: json['room_number'],


  );
  Map<String, dynamic> tojson() {
    return {"customar_id": customar_id,"indate": indate,"outdate": outdate, "name": name, "email": email, "phone": phone, "passport": passport, "nid": nid, "room_number": room_number};
  }
}