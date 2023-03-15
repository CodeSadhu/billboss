import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/common_methods.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/strings.dart';
import 'package:invoice_generator/utils/svg_paths.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          screenSize.height * appBarSize,
        ),
        child: AppBar(
          backgroundColor: ColorPalette.tealBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          toolbarHeight: screenSize.height * appBarSize,
          title: Text(
            CommonStrings.appTitle,
            style: h1Style(
              screenSize: screenSize,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
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
      return Container(
        decoration: BoxDecoration(
          boxShadow: getBoxShadow,
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01,
          horizontal: screenSize.width * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              SvgPath.noteList,
              height: screenSize.height * 0.022,
            ),
            Text(
              'Looks like you haven\'t created any invoices yet. Tap below to create your first invoice!',
              style: h3Style(
                screenSize: screenSize,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: ColorPalette.white,
              ),
              label: Text(
                'Add invoice',
                style: h2Style(
                  screenSize: screenSize,
                  color: ColorPalette.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
