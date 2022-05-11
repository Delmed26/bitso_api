import 'package:bitso_api/models/ticker_model.dart';
import 'package:bitso_api/widgets/chart_widget.dart';
import 'package:bitso_api/widgets/conversion_widget.dart';
import 'package:bitso_api/widgets/percentage_widget.dart';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class CryptoList extends StatelessWidget {
  
  final List<Ticker> tickers;

  const CryptoList({Key? key, required this.tickers}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Top currencies',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (_, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: tickers.length,
              itemBuilder: (_, int index) {
                return _TopCurrencieCard(tickers[index]);
              }
            ),
          ),
        ],
      ),
    );
  }
}


class _TopCurrencieCard extends StatelessWidget {

  final Ticker ticker;

  const _TopCurrencieCard(this.ticker);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(17, 19, 30, 1)
      ),
      padding: const EdgeInsets.all(20),
      width: 300,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConversionWidget(ticker.bookFrom, ticker.bookTo),
          SizedBox(
            width: double.infinity,
            height: 100,
            //TODO: Change width of chart
            child:  ChartWidget(
              trades: ticker.trades,
              growing: ticker.growing ?? true
            )
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${ticker.ask} MXN'),
                PercentageWidget('${ticker.percentage24h}', ticker.growing!)
              ],
            )
          )
        ],
      ),
    );
  }
}

