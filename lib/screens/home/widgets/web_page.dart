import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/screens/home/widgets/invoice_list_widget.dart';
import 'package:invoice_generator/utils/color_palette.dart';

class WebPage extends StatefulWidget {
  const WebPage({
    Key? key,
    required this.invoiceList,
  }) : super(key: key);

  final List invoiceList;

  @override
  State<WebPage> createState() => _WebPageState(invoiceList: invoiceList);
}

class _WebPageState extends State<WebPage> {
  late Size screenSize;

  _WebPageState({required this.invoiceList});

  List invoiceList = [];

  final SideMenuController _sideMenuController = SideMenuController();

  final List<SideMenuItem> _sideMenuItems = [
    const SideMenuItem(
      priority: 0,
      title: 'Add',
      icon: Icon(
        Icons.add,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.02,
          horizontal: screenSize.width * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              style: SideMenuStyle(
                backgroundColor: ColorPalette.secondaryColor,
              ),
              items: _sideMenuItems,
              controller: _sideMenuController,
            ),
            Expanded(
              child: PageView(
                children: [
                  InvoiceListWidget(
                    invoiceList: invoiceList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
