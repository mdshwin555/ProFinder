
class expertmodel {

  static String url = '';

  expertmodel({
    required this.name,
    required this.photo,
    required this.address,
    required this.price,
    required this.phone_number,
  });

  final String? name;
  final String? photo;
  final String? address;
  final String? price;
  final String? phone_number;

  factory expertmodel.fromJson(Map<String, dynamic> json) => expertmodel(
    name: json["name"] ?? '',
    photo: json["photo"] ?? '',
    address: json["address"]??'',
    price: json["price"]??'',
    phone_number: json["phone_number"] ?? '',
  );


}
