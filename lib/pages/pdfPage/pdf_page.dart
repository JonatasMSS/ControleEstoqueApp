import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:genilson_app/models/PdfModel/PdfModel.dart';
import 'package:printing/printing.dart';
import 'package:get/get.dart';

class PdfPage extends StatelessWidget {
  PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> ordersFromPage = Get.arguments;
    final PdfModel pdfModelToPage = PdfModel(
      clientName: 'Cliente Teste',
      valueTotal: ordersFromPage['total'],
      order: ordersFromPage['orders'],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: PdfPreview(
        pdfFileName: 'ProdutosCliente.pdf',
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
        shouldRepaint: true,
        previewPageMargin:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        build: (format) => pdfModelToPage.generatePDF(),
      ),
    );
  }
}
