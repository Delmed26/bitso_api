import 'package:bitso_api/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrenciesService extends ChangeNotifier {

  final String _baseUrl = 'api.bitso.com';

  List<Ticker> tickers = [];
  List<Ticker> topTickers = [];

  CurrenciesService () {
    print('Iniciando provider');

    getTickers();
  }

  Future<String> _getResponse(String endpoint, [String book = '', String limit = '']) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'book': book,
        'limit': limit
      }
    );

    final http.Response response = await http.get(url);

    return response.body;
  }

  getTickers () async {
    final String jsonData = await _getResponse('/v3/ticker');

    final TickerResponse response = TickerResponse.fromJson(jsonData);

    if(response.success) {
      tickers = response.payload;
      await getTopTrades();
      notifyListeners();
    }
  }

  getTopTrades() async {
    
    Iterable<Ticker> books = tickers.getRange(0, 10);

    for (var book in books) {
      final String jsonData = await _getResponse('/v3/trades', book.book, '50');

      final TradeResponse response = TradeResponse.fromJson(jsonData);

      book.trades = [];

      for (var element in response.payload.reversed) {
        Map<String, Object> map = {
          'tid': element.tid,
          'price': element.price
        };
        
        book.trades!.add(map);
      }

      topTickers.add(book);
      
    }


    print('getTopTrades called');
  }
}