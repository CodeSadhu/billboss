import 'package:flutter/material.dart';
import 'package:invoice_generator/screens/home/widgets/empty_invoice_card.dart';

class InvoiceListWidget extends StatelessWidget {
  const InvoiceListWidget({
    Key? key,
    required this.invoiceList,
  }) : super(key: key);

  final List invoiceList;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
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
      },
    );
  }
}
