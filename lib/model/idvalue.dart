

import 'dart:convert';

IdValueRes idValueFromJson(String str) => IdValueRes.fromJson(json.decode(str));

String idValueToJson(IdValueRes data) => json.encode(data.toJson());

class IdValueRes {
    bool? error;
    String? msg;
   
    List<IdValue>? data;

    IdValueRes({
        this.error,
        this.msg,
       
        this.data,
    });

    factory IdValueRes.fromJson(Map<String, dynamic> json) => IdValueRes(
        error: json["error"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<IdValue>.from(json["data"]!.map((x) => IdValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class IdValue {
    dynamic id;
    String? value;
    bool? selected = false;
    int? index;

    IdValue({
        this.id,
        this.value,
        this.selected = false,
        this.index
    });

    factory IdValue.fromJson(Map<String, dynamic> json) => IdValue(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,  
    };
}
