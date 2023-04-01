import 'package:flutter/material.dart';
import 'package:billboss/common_widgets/text_styles.dart';
import 'package:billboss/screens/home/widgets/invoice_list_widget.dart';
import 'package:billboss/utils/color_palette.dart';
import 'package:billboss/utils/common_methods.dart';
import 'package:billboss/utils/constants.dart';
import 'package:billboss/utils/routes.dart';
import 'package:billboss/utils/strings.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({
    Key? key,
    required this.invoiceList,
  }) : super(key: key);

  final List invoiceList;

  @override
  State<MobilePage> createState() => _MobilePageState(invoiceList: invoiceList);
}

class _MobilePageState extends State<MobilePage> {
  late Size screenSize;

  _MobilePageState({required this.invoiceList});

  List invoiceList = [];

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        screenSize.height * appBarSize,
      ),
      child: AppBar(
        backgroundColor: ColorPalette.primaryBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              color: ColorPalette.buttonTextColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            offset: Offset(
              -screenSize.width * 0.04,
              screenSize.height * 0.045,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () => CommonMethods.logoutAndClearData(),
                  child: Text(
                    'Sign Out',
                    style: h3Style(
                      screenSize: screenSize,
                      color: ColorPalette.black,
                    ),
                  ),
                ),
              ];
            },
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        toolbarHeight: screenSize.height * appBarSize,
        title: Text(
          CommonStrings.appTitle,
          style: h1Style(
            screenSize: screenSize,
            fontSize: screenSize.height * 0.03,
            fontWeight: FontWeight.w500,
            color: ColorPalette.buttonTextColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = getScreenSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorPalette.primaryBackgroundColor,
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            const Icon(
              Icons.add,
              color: ColorPalette.buttonTextColor,
            ),
            Text(
              'Add Invoice',
              style: h2Style(
                screenSize: screenSize,
                color: ColorPalette.buttonTextColor,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: ColorPalette.secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.form);
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: screenSize.height * 0.02,
        ),
        child: InvoiceListWidget(invoiceList: invoiceList),
      ),
    );
  }
}
