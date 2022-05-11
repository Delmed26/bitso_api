import 'package:bitso_api/models/models.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class ChartWidget extends StatelessWidget {

  final List<Map<String, Object>>? trades;
  final bool growing;

  ChartWidget({Key? key, required this.trades, required this.growing}) : super(key: key);

  final test = [
                { 'tid': 'Sports', 'price': 275 },
                { 'tid': 'Strategy', 'price': 115 },
                { 'tid': 'Action', 'price': 120 },
                { 'tid': 'Shooter', 'price': 350 },
                { 'tid': 'Other', 'price': 150 },
                { 'tid': 'qwewqew', 'price': 675 },
                { 'tid': 'xzcasdasd', 'price': 215 },
                { 'tid': 'xcvxcv', 'price': 125 },
                { 'tid': 'dfsdfdgf', 'price': 380 },
                { 'tid': 'tryerty', 'price': 160 },
                { 'tid': 'yiio', 'price': 275 },
                { 'tid': 'jkhjk', 'price': 115 },
                { 'tid': 'Achdhgfdfion', 'price': 120 },
                { 'tid': 'cvbn', 'price': 350 },
                { 'tid': 'uyituyi', 'price': 150 },
                { 'tid': 'hjgkhjknbmbn', 'price': 275 },
                { 'tid': 'bnm,nm', 'price': 115 },
                { 'tid': 'fhgjrdtsfdgx', 'price': 120 },
                { 'tid': 'fADWdghgfbvc ', 'price': 156 },
                { 'tid': 'rtsegfdgsxd', 'price': 150 },
              ];

  @override
  Widget build(BuildContext context) {

    return Chart(
              data: trades ?? test,
              variables: {
                'tid': Variable(
                  accessor: (Map map) => map['tid'] as String,
                ),
                'price': Variable(
                  accessor: (Map map) => map['price'] as double,
                ),
              },
              elements: [
                LineElement(
                  color: ColorAttr(
                    value: growing  ? const Color.fromRGBO(22, 219, 101, 1)
                                    : const Color.fromRGBO(255, 87, 87, 1),
                  )
                )
              ],
            );
  }
}


