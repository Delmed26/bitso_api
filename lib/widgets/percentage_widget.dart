import 'package:flutter/material.dart';

class PercentageWidget extends StatelessWidget {

  final String percentage;
  final bool growing;

  const PercentageWidget(this.percentage, this.growing);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '$percentage%'),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: 
            growing ? const Icon(
                        Icons.arrow_drop_up_rounded,
                        color: Color.fromRGBO(22, 219, 101, 1),
                      ) : const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Color.fromRGBO(255, 87, 87, 1),
                      ) 
          )
        ]
      ),
      style: TextStyle(
        color: growing  ? const Color.fromRGBO(22, 219, 101, 1) 
                        : const Color.fromRGBO(255, 87, 87, 1),
        fontSize: 14
      ),
    );
  }
}