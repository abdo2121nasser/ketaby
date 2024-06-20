
class FavouritModel {
   int? total;
   List<Data>? data;

  FavouritModel({required this.total, required this.data});

   FavouritModel.fromJson({required Map<String, dynamic> json}) {
     if (json['data']['data'] != null) {
       data = [];
     }
      total= json['data']['total'];
      json['data']['data'].forEach((v) {
        data!.add(Data.fromJson(json: v));
      });

  }
}

class Data {
   int? id;
   String? name;
   String? price;
   String? category;
   String? image;
   num? discount;
   num? stock;
   num? bestSeller;
   double? priceAfterDiscount;

  Data(
      {required this.id,
      required this.name,
      required this.price,
     required this.priceAfterDiscount,
      required this.category,
      required this.image,
      required this.discount,
      required this.stock,
      required this.bestSeller});

  factory Data.fromJson({required Map<String, dynamic> json}) {
  double p=double.parse(json['price'])-(double.parse(json['price'])*(json['discount']/100));
     return Data(
       id: json['id'],
        name: json['name'],
        price: json['price'],
        priceAfterDiscount:  p,
        category: json['category'],
        image: json['image'],
        discount: json['discount'],
        stock: json['stock'],
        bestSeller: json['best_seller'],
     );
  }
}
