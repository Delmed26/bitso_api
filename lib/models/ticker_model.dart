import 'package:meta/meta.dart';
import 'dart:convert';

class Ticker {
    Ticker({
        required this.high,
        required this.last,
        required this.createdAt,
        required this.book,
        required this.volume,
        required this.vwap,
        required this.low,
        required this.ask,
        required this.bid,
        required this.change24,
        this.growing,
        this.trades
    });

    String high;
    String last;
    DateTime createdAt;
    String book;
    String volume;
    String vwap;
    String low;
    String ask;
    String bid;
    String change24;
    bool? growing;
    List<Map<String, Object>>? trades;

    get percentage24h {
      double total;
      double askTrade = double.parse(ask);
      if(change24.contains('-')){
        growing = false;
        total = askTrade - double.parse(change24);
      }
      else {
        growing = true;
        total = askTrade + double.parse(change24);
      }

      double percentage = ((askTrade * 100) / total);

      return (100-percentage).toStringAsFixed(2);
    }

    get bookFrom {
      return book.split('_').first;
    }

    get bookTo {
      return book.split('_').last;
    }

    factory Ticker.fromJson(String str) => Ticker.fromMap(json.decode(str));

    factory Ticker.fromMap(Map<String, dynamic> json) => Ticker(
        high: json["high"],
        last: json["last"],
        createdAt: DateTime.parse(json["created_at"]),
        book: json["book"],
        volume: json["volume"],
        vwap: json["vwap"],
        low: json["low"],
        ask: json["ask"],
        bid: json["bid"],
        change24: json["change_24"],
    );
}

class Trade {
    Trade({
        required this.book,
        required this.createdAt,
        required this.amount,
        required this.makerSide,
        required this.price,
        required this.tid,
    });

    String book;
    String createdAt;
    String amount;
    String makerSide;
    double price;
    String tid;

    factory Trade.fromJson(String str) => Trade.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Trade.fromMap(Map<String, dynamic> json) => Trade(
        book: json["book"],
        createdAt: json["created_at"],
        amount: json["amount"],
        makerSide: json["maker_side"],
        price: double.parse(json["price"]),
        tid: json["tid"].toString(),
    );

    Map<String, dynamic> toMap() => {
        "book": book,
        "created_at": createdAt,
        "amount": amount,
        "maker_side": makerSide,
        "price": price,
        "tid": tid,
    };

}