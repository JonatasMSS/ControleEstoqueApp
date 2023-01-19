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
        shouldRepaint: true,
        previewPageMargin:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        build: (format) => generatePDF(),
      ),
    );
  }
}

Future<Uint8List> generatePDF() async {
  final List<Map<String, dynamic>> produtos = List.generate(57, (index) {
    return {
      'Nome': 'Produto',
      'UN': 'UN',
      'Quantidade': index.toString(),
      'Price': '00,00',
      'Total': '00,00'
    };
  }).toList();
  final List<dynamic> produtosWidgets = produtos.map((e) {
    return pw.Row(
      children: [
        pw.Expanded(
          child: pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1),
            ),
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text(e['Nome'], textAlign: pw.TextAlign.center),
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1),
            ),
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text(e['UN'], textAlign: pw.TextAlign.center),
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1),
            ),
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text(e['Quantidade'], textAlign: pw.TextAlign.center),
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1),
            ),
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text(e['Price'], textAlign: pw.TextAlign.center),
          ),
        ),
        pw.Expanded(
          child: pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1),
            ),
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text(
              e['Total'],
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }).toList();
  final pdf = pw.Document(
    compress: true,
    title: 'Lista de produtos',
  );
  final font = await PdfGoogleFonts.nunitoRegular();

  pdf.addPage(
    pw.Page(
      theme: pw.ThemeData(
        defaultTextStyle: pw.TextStyle(font: font, fontSize: 15),
      ),
      build: (context) {
        return pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
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
                  ),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child:
                          pw.Text('Fornecedor: Genilson', textScaleFactor: 1),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text('Destinatário:[nome cliente]'),
                    ),
                  ),
                ],
              ),
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text('Data de emissão:00/00/00'),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text(
                        'Valor total:RS 00,00',
                        textScaleFactor: 1,
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Divider(thickness: 1, height: 1),
              pw.Text('Produtos', textScaleFactor: 1.5),
              pw.SizedBox(height: 10),

              //Abaixo a main Row
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex('#d9d9d9'),
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text('Nome', textAlign: pw.TextAlign.center),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex('#d9d9d9'),
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text('UN', textAlign: pw.TextAlign.center),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex('#d9d9d9'),
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child:
                          pw.Text('Quantidade', textAlign: pw.TextAlign.center),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex('#d9d9d9'),
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text('Preço unitário',
                          textAlign: pw.TextAlign.center),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                      decoration: pw.BoxDecoration(
                        color: PdfColor.fromHex('#d9d9d9'),
                        border: pw.Border.all(width: 1),
                      ),
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text(
                        'Valor total',
                        textAlign: pw.TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              //Lista dos produtos
              ...produtosWidgets.getRange(0, 18),
            ],
          ),
        );
      },
    ),
  );
  produtosWidgets.length >= 18
      ? pdf.addPage(pw.Page(
          theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(font: font, fontSize: 13),
          ),
          build: (context) {
            return pw.Column(
              children: [
                ...produtosWidgets.skip(18),
              ],
            );
          },
        ))
      : '';
  return pdf.save();
}
