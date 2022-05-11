import 'package:bitso_api/services/currencies_service.dart';
import 'package:bitso_api/widgets/crypto_list.dart';
import 'package:bitso_api/widgets/currencies_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final currenciesService = Provider.of<CurrenciesService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrencies'),
      ),
      body: ListView(
        children: [
      
            CryptoList(tickers: currenciesService.topTickers),
      
            CurrenciesList(tickers: currenciesService.tickers)
        ],
      )
    );
  }
}