// To parse this JSON data, do
//
//     final tickerResponse = tickerResponseFromMap(jsonString);



import 'package:bitso_api/models/ticker_model.dart';
import 'dart:convert';

class TickerResponse {
    TickerResponse({
        required this.success,
        required this.payload,
    });

    bool success;
    List<Ticker> payload;

    factory TickerResponse.fromJson(String str) => TickerResponse.fromMap(json.decode(str));

    factory TickerResponse.fromMap(Map<String, dynamic> json) => TickerResponse(
        success: json["success"],
        payload: List<Ticker>.from(json["payload"].map((x) => Ticker.fromMap(x))),
    );

}


