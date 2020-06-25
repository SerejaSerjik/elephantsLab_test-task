import 'package:flutter/material.dart';

class CurrencyInfo extends StatelessWidget {
  final Color color;
  final String title;
  final String ticker;
  final double exchangeRate;
  final double amount;
  final double usdAmount;

  CurrencyInfo({
    Key key,
    @required this.color,
    @required this.title,
    @required this.ticker,
    @required this.exchangeRate,
    @required this.amount,
    @required this.usdAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text("1 $ticker = \$$exchangeRate | "),
                            Text(
                              "- 1,05 ↓",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    amount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "\$ ${usdAmount.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(142, 142, 147, 1),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Color.fromRGBO(239, 239, 245, 1),
        ),
      ],
    );
  }
}
