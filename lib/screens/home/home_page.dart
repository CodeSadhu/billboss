import 'package:flutter/material.dart';
import 'package:billboss/screens/home/widgets/temp.dart';
import 'package:billboss/screens/home/widgets/web_page.dart';
import 'package:billboss/utils/common_methods.dart';
import 'package:billboss/screens/home/widgets/mobile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  late Size screenSize;

  List invoiceList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPhone = CommonMethods.isMobilePlatform();
    if (isPhone) {
      return MobilePage(invoiceList: invoiceList);
    } else {
      return WebPage(invoiceList: invoiceList);
      // return MyHomePage(title: 'title');
    }
  }
}
