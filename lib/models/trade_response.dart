// To parse this JSON data, do
//
//     final tradeResponse = tradeResponseFromMap(jsonString);

import 'package:bitso_api/models/ticker_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class TradeResponse {
    TradeResponse({
        required this.success,
        required this.payload,
    });

    bool success;
    List<Trade> payload;

    factory TradeResponse.fromJson(String str) => TradeResponse.fromMap(json.decode(str));


    factory TradeResponse.fromMap(Map<String, dynamic> json) => TradeResponse(
        success: json["success"],
        payload: List<Trade>.from(json["payload"].map((x) => Trade.fromMap(x))),
    );

}

