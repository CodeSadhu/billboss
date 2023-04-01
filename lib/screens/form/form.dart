import 'package:billboss/common_widgets/text_styles.dart';
import 'package:billboss/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:billboss/utils/color_palette.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Invoice',
          style: appbarStyle(
            screenSize: screenSize,
            color: ColorPalette.black,
          ),
        ),
      ),
      body: Container(
        padding: getScaffoldPadding(screenSize: screenSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: buildTextfieldBorder(
                  fillColor: ColorPalette.buttonTextColor,
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
