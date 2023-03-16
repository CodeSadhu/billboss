import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/svg_paths.dart';

class EmptyInvoiceCard extends StatelessWidget {
  const EmptyInvoiceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: getBoxShadow,
        color: ColorPalette.buttonTextColor,
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
