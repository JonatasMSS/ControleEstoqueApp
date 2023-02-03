import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:genilson_app/models/PdfModel/PdfModel.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:get/get.dart';

class PdfPage extends StatelessWidget {
  PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> ordersFromPage = Get.arguments;
    final PdfModel pdfModelToPage = PdfModel(
      clientName: ordersFromPage['client'],
      valueTotal: ordersFromPage['total'],
      order: ordersFromPage['orders'],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed('/');
          return false;
        },
        child: PdfPreview(
          actions: [
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () => Get.offAllNamed('/'),
                child: const Text(
                  'SAIR',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )),
          ],
          pdfFileName: 'ProdutosCliente.pdf',
          canChangePageFormat: false,
          canChangeOrientation: false,
          canDebug: false,
          shouldRepaint: true,
          previewPageMargin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          build: (format) => pdfModelToPage.generatePDF(),
        ),
      ),
    );
  }
}
