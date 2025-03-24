// To parse this JSON data, do
//
//     final homeCaro = homeCaroFromJson(jsonString);

import 'dart:convert';

HomeCaro homeCaroFromJson(String str) => HomeCaro.fromJson(json.decode(str));

String homeCaroToJson(HomeCaro data) => json.encode(data.toJson());

class HomeCaro {
    String? title;
    String? subtitle;
    String? img;
    String? btntext;

    HomeCaro({
        this.title,
        this.subtitle,
        this.img,
        this.btntext,
    });

    factory HomeCaro.fromJson(Map<String, dynamic> json) => HomeCaro(
        title: json["title"],
        subtitle: json["subtitle"],
        img: json["img"],
        btntext: json["btntext"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "img": img,
        "btntext": btntext,
    };
}
