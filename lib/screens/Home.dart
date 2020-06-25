import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/elephants_icons_icons.dart';

import './Wallet.dart';
import './Statistic.dart';
import './Swap.dart';
import './Sync.dart';
import './Settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int pageIndex = 2;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 2);
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(252, 223, 39, 1),
                  Color.fromRGBO(254, 188, 48, 1)
                ],
              ),
            ),
          ),
          PageView(
            children: <Widget>[
              Statistic(),
              Swap(),
              Wallet(),
              Sync(),
              Settings(),
            ],
            controller: pageController,
            onPageChanged: onPageChanged,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(239, 239, 245, 1),
          ),
        ),
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(ElephantsIcons.bar_chart),
          ),
          BottomNavigationBarItem(
            icon: Icon(ElephantsIcons.swap),
          ),
          BottomNavigationBarItem(
            icon: Icon(ElephantsIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(ElephantsIcons.sync_icon),
          ),
          BottomNavigationBarItem(
            icon: Icon(ElephantsIcons.settings),
          )
        ],
      ),
    );
  }
}
