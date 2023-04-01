import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:billboss/common_widgets/text_styles.dart';
import 'package:billboss/screens/home/widgets/invoice_list_widget.dart';
import 'package:billboss/utils/color_palette.dart';
import 'package:billboss/utils/common_methods.dart';

class WebPage extends StatefulWidget {
  const WebPage({
    Key? key,
    required this.invoiceList,
  }) : super(key: key);

  final List invoiceList;

  @override
  // ignore: no_logic_in_create_state
  State<WebPage> createState() => _WebPageState(invoiceList: invoiceList);
}

class _WebPageState extends State<WebPage> {
  late Size screenSize;

  _WebPageState({required this.invoiceList});

  List invoiceList = [];

  final SideMenuController _sideMenuController = SideMenuController();
  final PageController _pageController = PageController();

  final List<SideMenuItem> _sideMenuItems = [
    SideMenuItem(
      priority: 0,
      title: 'Add',
      badgeColor: ColorPalette.white,
      icon: Icon(
        Icons.add,
        color: ColorPalette.white,
      ),
      onTap: (pageIndex, controller) {
        controller.changePage(pageIndex);
      },
    ),
    SideMenuItem(
      priority: 1,
      title: 'Sign Out',
      badgeColor: ColorPalette.white,
      icon: Icon(
        Icons.logout,
        color: ColorPalette.white,
      ),
      onTap: (pageIndex, controller) {
        // controller.changePage(pageIndex);
        CommonMethods.logoutAndClearData();
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
    _sideMenuController.addListener((page) {
      _pageController.jumpToPage(page);
    });
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
          horizontal: screenSize.width * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SideMenu(
              onDisplayModeChanged: (value) {
                print('Mode changed to: $value');
              },
              title: Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.02,
                ),
                child: Text(
                  'BillBoss',
                  style: h2Style(
                    screenSize: screenSize,
                  ),
                ),
              ),
              style: SideMenuStyle(
                backgroundColor: ColorPalette.secondaryColor,
                displayMode: SideMenuDisplayMode.auto,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              showToggle: true,
              // displayModeToggleDuration: Duration.zero,
              items: _sideMenuItems,
              controller: _sideMenuController,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  InvoiceListWidget(
                    invoiceList: invoiceList,
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        'Remove Invoices',
                        style: h2Style(
                          screenSize: screenSize,
                        ),
                      ),
                    ),
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
