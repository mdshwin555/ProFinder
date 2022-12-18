
class expertmodel {

   int? index;

  expertmodel({
    required this.name,
    required this.photo,
    required this.address,
    required this.price,
    required this.phonenumber,
  });

  final String? name;
  final String? photo;
  final String? address;
  final String? price;
  final String? phonenumber;

  factory expertmodel.fromJson(Map<String, dynamic> json) => expertmodel(
    name: json[0][0]['name'],
    photo: json["photo"] != null ? json["photo"] : null,
    address: json["address"]??'',
    price: json["price"]??'',
    phonenumber: json["phone_number"] ?? '',
  );


}
