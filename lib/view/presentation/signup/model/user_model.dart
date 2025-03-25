// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserData userdataFromJson(String str) => UserData.fromJson(json.decode(str));

String userdataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String? uid;
    String? name;
    String? email;
    String? password;
    String? pincode;
    String? address;
    String? city;
    String? state;
    String? country;
    String? accountno;
    String? holdername;
    String? ifsccode;
    DateTime? date;

    UserData({
        this.uid,
        this.name,
        this.email,
        this.password,
        this.pincode,
        this.address,
        this.city,
        this.state,
        this.country,
        this.accountno,
        this.holdername,
        this.ifsccode,
        this.date
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        pincode: json["pincode"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        accountno: json["accountno"],
        holdername: json["holdername"],
        ifsccode: json["ifsccode"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "password": password,
        "pincode": pincode,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "accountno": accountno,
        "holdername": holdername,
        "ifsccode": ifsccode,
        "date": DateTime.now(),
    };
}
