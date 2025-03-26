// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
    String? id;
    String? address;
    String? phone;
    String? pincode;

    Address({
        this.id,
        this.address,
        this.phone,
        this.pincode,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        phone: json["phone"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "phone": phone,
        "pincode": pincode,
    };
}
