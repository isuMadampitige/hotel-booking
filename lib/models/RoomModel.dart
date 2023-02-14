class RoomModel {
  String type;
  int price;
  String desc;

  RoomModel({
    required this.type,
    required this.price,
    required this.desc,
  });

  factory RoomModel.fromMap(Map<String, dynamic> json) {
    return RoomModel(
      type: json['type'] ?? "",
      price: json['price'] ?? "",
      desc: json['description'],
    );
  }
}
