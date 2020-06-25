import 'package:elephantslab_test/presentation/elephants_icons_icons.dart';
import 'package:flutter/material.dart';

import './DashedDivider.dart';
import './TransactionDetails.dart';

class TransactionInfo extends StatelessWidget {
  final String
      date; //в курсе, что дату стоит передавать соответствующим типом, но в целях экономии времени кидаю строкой
  final bool isDeposit;
  final bool isDone;
  final String ticker;
  final double amount;
  final double usdAmount;

  TransactionInfo({
    Key key,
    @required this.date,
    @required this.isDeposit,
    @required this.isDone,
    @required this.ticker,
    @required this.amount,
    @required this.usdAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            useRootNavigator: true,
            isScrollControlled: true,
            context: context,
            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            builder: (BuildContext context) {
              return DraggableScrollableSheet(
                expand: true,
                builder: (context, ScrollController scrollController) {
                  return TransactionDetails(
                    isDeposit: isDeposit,
                    isDone: isDone,
                    ticker: ticker,
                    amount: amount,
                    usdAmount: usdAmount,
                    scrollController: scrollController,
                  );
                },
                initialChildSize: 0.95,
                maxChildSize: 0.95,
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Color.fromRGBO(239, 239, 245, 1),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      date,
                      style: TextStyle(
                        color: Color.fromRGBO(142, 142, 147, 1),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isDone
                            ? Color.fromRGBO(52, 199, 89, 0.1)
                            : Color.fromRGBO(102, 102, 107, 0.1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7.5,
                          ),
                          child: Text(
                            isDone
                                ? "Виконано".toUpperCase()
                                : "В роботi".toUpperCase(),
                            style: TextStyle(
                              color: isDone
                                  ? Color.fromRGBO(52, 199, 89, 1)
                                  : Color.fromRGBO(102, 102, 107, 1),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: DashedDivider(
                  color: Color.fromRGBO(239, 239, 245, 1),
                  height: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isDeposit
                                  ? Color.fromRGBO(52, 199, 89, 0.5)
                                  : Color.fromRGBO(255, 45, 85, 0.5),
                              width: 2,
                            ),
                            color: isDeposit
                                ? Color.fromRGBO(52, 199, 89, 0.1)
                                : Color.fromRGBO(255, 45, 85, 0.1),
                          ),
                          child: Icon(
                            isDeposit
                                ? ElephantsIcons.arrow_down
                                : ElephantsIcons.arrow_up,
                            size: 10,
                            color: isDeposit
                                ? Color.fromRGBO(52, 199, 89, 0.5)
                                : Color.fromRGBO(255, 45, 85, 0.5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            isDeposit ? "Получено" : "Отправлено",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 239, 245, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 7.5,
                            ),
                            child: Text(
                              ticker,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          isDeposit
                              ? "+ ${amount.toString()}"
                              : "- ${amount.toString()}",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
