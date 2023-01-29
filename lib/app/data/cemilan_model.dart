class Cemilan {
  int? i;
  int? id;
  String? name;
  int? price;
  String? description;
  String? image;
  int? qty;
  int? totalPrice;

  Cemilan(
      {this.i,
      this.id,
      this.name,
      this.price,
      this.description,
      this.image,
      this.qty,
      this.totalPrice});

  Cemilan.fromJson(Map<String, dynamic> json) {
    i = json['i'];
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    qty = 0;
    totalPrice = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['i'] = i;
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
