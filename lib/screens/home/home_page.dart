import 'package:flutter/material.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/screens/home/widgets/empty_invoice_card.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/common_methods.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/strings.dart';

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
    screenSize = getScreenSize(context);
    return Scaffold(
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
        onPressed: () {},
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: screenSize.height * 0.02,
        ),
        child: buildInvoiceList(invoiceList),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        screenSize.height * appBarSize,
      ),
      child: AppBar(
        backgroundColor: ColorPalette.primaryBackgroundColor,
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

  Widget buildInvoiceList(List invoiceList) {
    if (invoiceList.isNotEmpty) {
      return ListView.builder(
        itemCount: invoiceList.length,
        itemBuilder: ((context, index) {
          return const ListTile(
            title: Text(''),
            subtitle: Text(''),
          );
        }),
      );
    } else {
      return const EmptyInvoiceCard();
    }
  }
}
