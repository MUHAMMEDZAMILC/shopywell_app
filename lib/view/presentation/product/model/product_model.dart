// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    String? id;
    String? title;
    double? price;
    double? mrp;
    String? off;
    String? description;
    String? category;
    String? image;
    int? whish=0;
    Rating? rating;

    Products({
        this.id,
        this.title,
        this.price,
        this.mrp,
        this.off,
        this.description,
        this.category,
        this.image,
        this.whish,
        this.rating,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        mrp: json["mrp"]?.toDouble(),
        description: json["description"],
        off: json["off"],
        category: json["category"],
        whish: json["whish"] ?? 0,
        image: json["image"],

        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "mrp": mrp,
        "off": off,
        "description": description,
        "category": category,
        "image": image,
        "whish": whish ?? 0,
        "rating": rating?.toJson(),
    };
}

class Rating {
    double? rate;
    int? count;

    Rating({
        this.rate,
        this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
