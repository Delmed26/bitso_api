import 'package:bitso_api/models/models.dart';
import 'package:bitso_api/widgets/conversion_widget.dart';
import 'package:bitso_api/widgets/percentage_widget.dart';
import 'package:flutter/material.dart';

class CurrenciesList extends StatelessWidget {

  final List<Ticker> tickers;

  const CurrenciesList({Key? key, required this.tickers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Currencies',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.left,
          ),
        ),
        
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: tickers.length,
          itemBuilder: (_, int index) => _CurrenciesWidget(tickers[index])
        )
      ],
    );
  }
}

class _CurrenciesWidget extends StatelessWidget {

  final Ticker ticker;

  const _CurrenciesWidget(this.ticker);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(17, 19, 30, 1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConversionWidget(ticker.bookFrom, ticker.bookTo),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: PercentageWidget(ticker.percentage24h, ticker.growing!),
                ),
                Text('\$${ticker.ask} MXN')
              ],
            ),
          ],
        ),
      ),
    );
  }
}