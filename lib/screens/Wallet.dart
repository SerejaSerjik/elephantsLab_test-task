import 'package:flutter/material.dart';
import 'dart:math';

import '../presentation/elephants_icons_icons.dart';
import '../widgets/CurrencyInfo.dart';
import '../widgets/TransactionInfo.dart';

class Wallet extends StatelessWidget {
  final double balance = 1374.04;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Transform.rotate(
                        angle: 90 * pi / 180,
                        child: Icon(
                          ElephantsIcons.bar_chart,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Название кошелька",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Icon(
                              ElephantsIcons.bell,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              ElephantsIcons.message,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Ваш баланс",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Text(
                    "\$ $balance",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Мои активы",
                              style: TextStyle(
                                color: Color.fromRGBO(142, 142, 147, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              ElephantsIcons.add,
                              size: 20,
                              color: Color.fromRGBO(174, 174, 180, 1),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            CurrencyInfo(
                              image: Image.asset('assets/images/bitcoin.png'),
                              title: "Bitcoin",
                              ticker: "BTC",
                              exchangeRate: 0.0232,
                              amount: 0.23243,
                              usdAmount: 32232,
                            ),
                            CurrencyInfo(
                              image: Image.asset('assets/images/ethereum.png'),
                              title: "Ethereum",
                              ticker: "ETH",
                              exchangeRate: 0.0232,
                              amount: 0.23243,
                              usdAmount: 32232,
                            ),
                            CurrencyInfo(
                              image: Image.asset('assets/images/ripple.png'),
                              title: "Ripple",
                              ticker: "XRP",
                              exchangeRate: 0.0232,
                              amount: 0.23243,
                              usdAmount: 32232,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Мои транзакции",
                              style: TextStyle(
                                color: Color.fromRGBO(142, 142, 147, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              ElephantsIcons.watch,
                              size: 20,
                              color: Color.fromRGBO(174, 174, 180, 1),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          TransactionInfo(
                            date: "23 квiтня 2020р",
                            isDeposit: false,
                            isDone: false,
                            ticker: "ETN",
                            amount: 0.23243,
                            usdAmount: 232,
                          ),
                          TransactionInfo(
                            date: "23 квiтня 2020р",
                            isDeposit: true,
                            isDone: true,
                            ticker: "ETN",
                            amount: 0.23243,
                            usdAmount: 232,
                          ),
                          TransactionInfo(
                            date: "23 квiтня 2020р",
                            isDeposit: true,
                            isDone: false,
                            ticker: "ETN",
                            amount: 0.23243,
                            usdAmount: 232,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
