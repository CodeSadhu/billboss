import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:billboss/common_widgets/text_styles.dart';
import 'package:billboss/utils/color_palette.dart';
import 'package:billboss/utils/svg_paths.dart';

class AppHeaderWidget extends StatelessWidget {
  const AppHeaderWidget({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          SvgPath.invoiceGraphic,
          height: screenSize.height * 0.2,
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Text(
          'BillBoss',
          style: appbarStyle(
            screenSize: screenSize,
            color: ColorPalette.secondaryColor,
          ),
        ),
      ],
    );
  }
}
