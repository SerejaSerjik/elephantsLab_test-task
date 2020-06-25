import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../presentation/elephants_icons_icons.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class TransactionDetails extends StatelessWidget {
  final bool isDeposit;
  final bool isDone;
  final String ticker;
  final double amount;
  final double usdAmount;
  final ScrollController scrollController;

  final bool statusOk = true;
  final String transactionID =
      "3a83d5335da98b69c927b6f5a4c6127c72d21caf290e657c27d8a1941d4860cb";

  TransactionDetails(
      {Key key,
      @required this.isDeposit,
      @required this.isDone,
      @required this.ticker,
      @required this.amount,
      @required this.usdAmount,
      @required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          controller: scrollController,
          children: <Widget>[
            Align(
              child: Container(
                width: 36,
                height: 5,
                color: Color.fromRGBO(228, 228, 234, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 24,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        isDeposit
                            ? ElephantsIcons.arrow_down_circle
                            : ElephantsIcons.arrow_up_circle,
                        color: isDeposit
                            ? Color.fromRGBO(52, 199, 89, 1)
                            : Color.fromRGBO(255, 45, 85, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          isDeposit
                              ? "Отримано $ticker"
                              : "Вiдправлено $ticker",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(142, 142, 147, 0.4),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Color.fromRGBO(35, 31, 32, 0.6),
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Статус"),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(52, 199, 89, 0.1)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Text(
                          "Подтверждено".toUpperCase(),
                          style: TextStyle(
                            color: Color.fromRGBO(52, 199, 89, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Сумма ${isDeposit ? "получения" : "отправки"}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(142, 142, 147, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "${isDeposit ? "+" : "-"} $amount $ticker",
                          style: TextStyle(
                              color: Color.fromRGBO(21, 21, 25, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Text(" | "),
                        Text(
                          "\$ $usdAmount",
                          style: TextStyle(
                              color: Color.fromRGBO(142, 142, 147, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Время",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(142, 142, 147, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "24 Марта, 2020 | 12:02:23",
                          style: TextStyle(
                              color: Color.fromRGBO(21, 21, 25, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "ID транзакции",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(142, 142, 147, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: <Widget>[
                            Text(
                              transactionID.replaceRange(10, 51, "..."),
                              style: TextStyle(
                                  color: Color.fromRGBO(21, 21, 25, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                          text:
                              transactionID)); //TODO: rewrite with clipboard_manager package and add snackbar after copiyng
                    },
                    child: Icon(
                      Icons
                          .content_copy, //заюзал дефолтную иконку, т.к. с той, что в макете были проблемы при внесении ее в набор кастомных
                      color: Color.fromRGBO(174, 174, 180, 1),
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Время",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(142, 142, 147, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "etherscan.io",
                              style: TextStyle(
                                  color: Color.fromRGBO(21, 21, 25, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL('https://etherscan.io/');
                    },
                    child: Icon(
                      ElephantsIcons.arrow_square_up_right,
                      color: Color.fromRGBO(174, 174, 180, 1),
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Количество подтверждений",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(142, 142, 147, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "+10",
                          style: TextStyle(
                              color: Color.fromRGBO(21, 21, 25, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Адрес отправителя",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(142, 142, 147, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: <Widget>[
                            Text(
                              transactionID.replaceRange(10, 51, "..."),
                              style: TextStyle(
                                  color: Color.fromRGBO(21, 21, 25, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                          text:
                              transactionID)); //TODO: rewrite with clipboard_manager package and add snackbar after copiyng
                    },
                    child: Icon(
                      Icons
                          .content_copy, //заюзал дефолтную иконку, т.к. с той, что в макете были проблемы при внесении ее в набор кастомных
                      color: Color.fromRGBO(174, 174, 180, 1),
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Проверки адреса",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(142, 142, 147, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "???",
                          style: TextStyle(
                              color: Color.fromRGBO(21, 21, 25, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 100,) //что бы при скролле вверх не пропадал последний элемент за кнопкой
          ],
        ),
        Positioned(
          bottom: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {
                _launchURL('https://t.me/serejaserjik');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 206, 46, 1),
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width - 30,
                height: 55,
                child: Align(
                  child: Text(
                    "Связаться с тех. поддержкой",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
