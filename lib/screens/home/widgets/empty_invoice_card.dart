import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:billboss/common_widgets/text_styles.dart';
import 'package:billboss/utils/color_palette.dart';
import 'package:billboss/utils/constants.dart';
import 'package:billboss/utils/svg_paths.dart';

class EmptyInvoiceCard extends StatelessWidget {
  const EmptyInvoiceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: kIsWeb == false ? double.infinity : null,
      decoration: BoxDecoration(
        boxShadow: getBoxShadow,
        color: ColorPalette.buttonTextColor,
        borderRadius: kIsWeb
            ? const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )
            : BorderRadius.circular(20),
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
            height: screenSize.height * 0.2,
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Text(
            'No invoices here.\nTap below to create your first invoice!',
            style: h3Style(
              screenSize: screenSize,
              color: ColorPalette.tertiaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.secondaryColor,
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.02,
                horizontal: screenSize.width * 0.04,
              ),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: ColorPalette.buttonTextColor,
            ),
            label: Text(
              'Add invoice',
              style: h2Style(
                screenSize: screenSize,
                color: ColorPalette.buttonTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
