import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/ProductComponent/ProductComponent.dart';
import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';

import '../../components/NavBar/NavBarComponent.dart';

class PedidosToProdutosPage extends StatefulWidget {
  const PedidosToProdutosPage({super.key});

  @override
  State<PedidosToProdutosPage> createState() => _PedidosToProdutosPageState();
}

class _PedidosToProdutosPageState extends State<PedidosToProdutosPage> {
  List<ProductModel> testDatabase = [
    ProductModel(id: 0, name: 'Treloso', price: 23.50, quantity: 3),
    ProductModel(id: 1, name: 'Amendoim', price: 0.5, quantity: 2),
    ProductModel(id: 2, name: 'Paçoca', price: 0.5, quantity: 5),
  ];
  late List<OrderModel> pageOrder;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      pageOrder = [];
    });
    super.initState();
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
                child: Text('Valor total: 10,00'),
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
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: const Color(0xFFE4E4E4),
        appBar: NavBarComponent(NavBarTitle: 'Realizar Pedidos'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const InputSearchComponent(
                hintText: 'Digite o nome do produto',
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: testDatabase.length,
                itemBuilder: (context, index) {
                  final ProductModel produto = testDatabase[index];
                  return ProductComponent(
                    produto: produto,
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
