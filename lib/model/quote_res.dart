// To parse this JSON data, do
//
//     final quoteRes = quoteResFromJson(jsonString);

import 'dart:convert';

List<QuoteRes> quoteResFromJson(String str) => List<QuoteRes>.from(json.decode(str).map((x) => QuoteRes.fromJson(x)));

String quoteResToJson(List<QuoteRes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuoteRes {
    String? q;
    String? a;
    String? c;
    String? h;

    QuoteRes({
        this.q,
        this.a,
        this.c,
        this.h,
    });

    factory QuoteRes.fromJson(Map<String, dynamic> json) => QuoteRes(
        q: json["q"],
        a: json["a"],
        c: json["c"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "c": c,
        "h": h,
    };
}
