import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatelessWidget {
  PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: PdfPreview(
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
        previewPageMargin:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        build: (format) => generatePDF(),
      ),
    );
  }
}

Future<Uint8List> generatePDF() async {
  final pdf = pw.Document(compress: true);
  final font = await PdfGoogleFonts.nunitoRegular();

  pdf.addPage(
    pw.Page(
      theme: pw.ThemeData(
        defaultTextStyle: pw.TextStyle(font: font, fontSize: 15),
      ),
      build: (context) {
        return pw.Expanded(
          child: pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                      'G&D Bomboniere',
                      textScaleFactor: 1.9,
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Column(
                      children: [
                        pw.Text('G&D',
                            style: const pw.TextStyle(
                              fontSize: 28,
                            )),
                        pw.Text(
                          'Bomboniere',
                          style: const pw.TextStyle(fontSize: 18),
                        ),
                        pw.Text('Org. Genilson Careca', textScaleFactor: 0.7)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
  return pdf.save();
}
