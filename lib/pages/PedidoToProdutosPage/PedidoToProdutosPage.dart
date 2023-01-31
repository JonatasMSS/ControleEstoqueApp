// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:get/get.dart';

import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/ProductComponent/ProductComponent.dart';
import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';
import 'package:genilson_app/pages/PedidoToProdutosPage/Dialogs/confirmation_dialog.dart';

import '../../components/NavBar/NavBarComponent.dart';
import '../../models/ClientModel/ClientModel.dart';

class PedidosToProdutosPage extends StatefulWidget {
  ObjectBox objectBox;

  PedidosToProdutosPage({
    Key? key,
    required this.objectBox,
  }) : super(key: key);

  @override
  State<PedidosToProdutosPage> createState() => _PedidosToProdutosPageState();
}

class _PedidosToProdutosPageState extends State<PedidosToProdutosPage> {
  late List<ProductModel> produtos;
  late EventsBox eventsBox;
  late List<OrderModel> pageOrder;
  late double valorTotal;
  late List<ProductModel> sugestionSearch;
  final String args = Get.arguments;
  @override
  void initState() {
    eventsBox = EventsBox(boxDatabase: widget.objectBox);
    produtos = eventsBox.getAllProducts()
      ..sort(
        (a, b) => a.name.compareTo(b.name),
      );
    setState(() {
      pageOrder = [];
      sugestionSearch = produtos;
      valorTotal = 0;
    });
    super.initState();
  }

  void returnValueTotal() {
    final sum = pageOrder.fold<double>(
        0, (previousValue, element) => previousValue + element.priceMultiplied);
    setState(() {
      valorTotal = sum;
    });
  }

  void searchDinamically(String query) {
    if (query.isEmpty) {
      setState(() {
        sugestionSearch = produtos;
      });
    } else {
      final suggestion = produtos.where((product) {
        final productName = product.name.toLowerCase();
        final input = query.toLowerCase();
        return productName.contains(input);
      }).toList();
      setState(() {
        sugestionSearch = suggestion;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: null,
              icon: const Icon(Icons.check),
              label: const Text(
                'Confirmar pedido',
                textScaleFactor: 1.1,
              ),
              backgroundColor: const Color(0xFF6AFF79),
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return ConfirmationDialog(
                      eventsBox: eventsBox,
                      orders: pageOrder,
                      total: valorTotal,
                      clientName: args,
                    );
                  },
                );
              },
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton.extended(
              label: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(minWidth: 110, maxWidth: 150),
                child: Text(
                  'Valor total: ${valorTotal.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () => {},
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE4E4E4),
        appBar: NavBarComponent(NavBarTitle: 'Realizar Pedidos'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InputSearchComponent(
                onChangedFunction: (value) {
                  searchDinamically(value);
                },
                hintText: 'Digite o nome do produto',
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sugestionSearch.length,
                itemBuilder: (context, index) {
                  final ProductModel produto = sugestionSearch[index];

                  return ProductComponent(
                    produto: produto,
                    orderPage: pageOrder,
                    changeSumationOnPage: returnValueTotal,
                  );
                },
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
