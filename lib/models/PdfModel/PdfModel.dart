// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/foundation.dart';

import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:printing/printing.dart';

class PdfModel {
  String clientName;

  double valueTotal;
  List<OrderModel> order;
  PdfModel({
    required this.clientName,
    required this.valueTotal,
    required this.order,
  });

  String _findTodayDate() {
    final DateTime today = DateTime.now();
    final String todayToSring = '${today.day}/${today.month}/${today.year}';
    return todayToSring;
  }

  Future<Uint8List> generatePDF() async {
    final List<dynamic> produtosWidgets = order.map((e) {
      return pw.Container(
          decoration: const pw.BoxDecoration(
              border: pw.Border(bottom: pw.BorderSide(color: PdfColors.black))),
          child: pw.Row(
            children: [
              pw.Expanded(
                flex: 3,
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(2),
                  child: pw.Text(e.product.name, textAlign: pw.TextAlign.left),
                ),
              ),
              // pw.Expanded(
              //   child: pw.Container(
              //     padding: const pw.EdgeInsets.all(2),
              //     child: pw.Text('UN', textAlign: pw.TextAlign.center),
              //   ),
              // ),
              pw.Expanded(
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(2),
                  child: pw.Text(e.quantity.toString(),
                      textAlign: pw.TextAlign.center),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(2),
                  child: pw.Text(e.product.price.toStringAsFixed(2),
                      textAlign: pw.TextAlign.center),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  padding: const pw.EdgeInsets.all(2),
                  child: pw.Text(
                    e.priceMultiplied.toStringAsFixed(2),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
            ],
          ));
    }).toList();

    final pdf = pw.Document(
      compress: true,
      title: 'Lista de produtos',
    );
    final font = await PdfGoogleFonts.nunitoRegular();

    pdf.addPage(
      pw.MultiPage(
        theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(font: font, fontSize: 15),
        ),
        build: (context) {
          return [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(
                        'M&S MStocker',
                        textScaleFactor: 1.9,
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                        children: [
                          pw.Text('M&S',
                              style: const pw.TextStyle(
                                fontSize: 28,
                              )),
                          pw.Text(
                            'MStocker ',
                            style: const pw.TextStyle(fontSize: 18),
                          ),
                          pw.Text('Org. MStocker', textScaleFactor: 0.7)
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
                        child: pw.Text('Fornecedor: ', textScaleFactor: 1),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(width: 1),
                        ),
                        padding: const pw.EdgeInsets.all(2),
                        child: pw.Text('Destinat??rio: $clientName'),
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
                        child: pw.Text('Data de emiss??o: ${_findTodayDate()}'),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(width: 1),
                        ),
                        padding: const pw.EdgeInsets.all(2),
                        child: pw.Text(
                          'Valor da nota: R\$ ${valueTotal.toStringAsFixed(2)}',
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
                      flex: 3,
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromHex('#d9d9d9'),
                          border: pw.Border.all(width: 1),
                        ),
                        padding: const pw.EdgeInsets.all(2),
                        child: pw.Text('Nome', textAlign: pw.TextAlign.center),
                      ),
                    ),
                    //TODO: UNIDADE REMOVIDA
                    // pw.Expanded(
                    //   child: pw.Container(
                    //     decoration: pw.BoxDecoration(
                    //       color: PdfColor.fromHex('#d9d9d9'),
                    //       border: pw.Border.all(width: 1),
                    //     ),
                    //     padding: const pw.EdgeInsets.all(2),
                    //     child: pw.Text('UN', textAlign: pw.TextAlign.center),
                    //   ),
                    // ),
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromHex('#d9d9d9'),
                          border: pw.Border.all(width: 1),
                        ),
                        padding: const pw.EdgeInsets.all(2),
                        child: pw.Text('Qt', textAlign: pw.TextAlign.center),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          color: PdfColor.fromHex('#d9d9d9'),
                          border: pw.Border.all(width: 1),
                        ),
                        padding: const pw.EdgeInsets.all(2),
                        child: pw.Text('Pre??o',
                            textAlign: pw.TextAlign.center, textScaleFactor: 1),
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
                          'Total',
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                //Lista dos produtos
                ...produtosWidgets,
              ],
            )
          ];
        },
      ),
    );
    // produtosWidgets.length >= 18
    //     ? pdf.addPage(pw.Page(
    //         theme: pw.ThemeData(
    //           defaultTextStyle: pw.TextStyle(font: font, fontSize: 15),
    //         ),
    //         build: (context) {
    //           return pw.Column(
    //             children: [
    //               ...produtosWidgets.skip(19),
    //             ],
    //           );
    //         },
    //       ))
    //     : '';
    return pdf.save();
  }

  String emissionDate() {
    final DateTime actualDate = DateTime.now();
    final String date =
        '${actualDate.day}/${actualDate.month}/${actualDate.year}';
    return date;
  }

  PdfModel copyWith({
    String? clientName,
    double? valueTotal,
    List<OrderModel>? order,
  }) {
    return PdfModel(
      clientName: clientName ?? this.clientName,
      valueTotal: valueTotal ?? this.valueTotal,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientName': clientName,
      'valueTotal': valueTotal,
      'order': order.map((x) => x.toMap()).toList(),
    };
  }

  factory PdfModel.fromMap(Map<String, dynamic> map) {
    return PdfModel(
      clientName: map['clientName'] as String,
      valueTotal: map['valueTotal'] as double,
      order: List<OrderModel>.from(
        (map['order'] as List<int>).map<OrderModel>(
          (x) => OrderModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PdfModel.fromJson(String source) =>
      PdfModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PdfModel(clientName: $clientName, valueTotal: $valueTotal, order: $order)';

  @override
  bool operator ==(covariant PdfModel other) {
    if (identical(this, other)) return true;

    return other.clientName == clientName &&
        other.valueTotal == valueTotal &&
        listEquals(other.order, order);
  }

  @override
  int get hashCode =>
      clientName.hashCode ^ valueTotal.hashCode ^ order.hashCode;
}
