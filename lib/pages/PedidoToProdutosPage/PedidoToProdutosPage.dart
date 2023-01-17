import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/ProductComponent/ProductComponent.dart';
import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';
import 'package:genilson_app/pages/PedidoToProdutosPage/Dialogs/confirmation_dialog.dart';

import '../../components/NavBar/NavBarComponent.dart';

class PedidosToProdutosPage extends StatefulWidget {
  const PedidosToProdutosPage({super.key});

  @override
  State<PedidosToProdutosPage> createState() => _PedidosToProdutosPageState();
}

class _PedidosToProdutosPageState extends State<PedidosToProdutosPage> {
  List<ProductModel> testDatabase = [
    ProductModel(id: 0, name: 'Traloso', price: 22.50, quantity: 3),
    ProductModel(id: 1, name: 'Treendoim', price: 0.5, quantity: 2),
    ProductModel(id: 2, name: 'pacoca', price: 0.5, quantity: 5),
  ];
  late List<OrderModel> pageOrder;
  late double valorTotal;
  late List<ProductModel> sugestionSearch;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      pageOrder = [];
      sugestionSearch = testDatabase;
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
        sugestionSearch = testDatabase;
      });
    } else {
      final suggestion = testDatabase.where((product) {
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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              label: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  minWidth: 110,
                ),
                child: Text('Valor total: ${valorTotal.toStringAsFixed(2)}'),
              ),
              onPressed: () => {},
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton.extended(
              heroTag: null,
              icon: const Icon(Icons.check),
              label: const Text(
                'Confirmar pedido',
                textScaleFactor: 1.4,
              ),
              backgroundColor: const Color(0xFF6AFF79),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return ConfirmationDialog(
                        orders: pageOrder,
                        total: valorTotal,
                      );
                    });
              },
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
