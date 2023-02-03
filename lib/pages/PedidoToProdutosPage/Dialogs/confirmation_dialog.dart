// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:genilson_app/components/SimpleButtonC/SimpleButtonC.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';

class ConfirmationDialog extends StatelessWidget {
  final List<OrderModel>? orders;
  final EventsBox eventsBox;
  final double? total;
  final String clientName;

  const ConfirmationDialog({
    Key? key,
    this.orders,
    required this.eventsBox,
    this.total,
    this.clientName = 'NO CLIENT',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3),
            topRight: Radius.circular(3),
          ),
          color: Colors.blue,
        ),
        child: const Text(
          'Confirmação de Pedido',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      children: [
        orders!.isNotEmpty
            ? SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: const Text(
                          'Os seguintes produtos serão confirmados para pedido:'),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orders?.length ?? 1,
                      itemBuilder: (context, index) {
                        final OrderModel? order = orders?[index];
                        const double scaleFont = 1.2;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.black,
                          ))),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '${order!.quantity}x',
                                textAlign: TextAlign.center,
                                textScaleFactor: scaleFont,
                              )),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    order.product.name,
                                    textScaleFactor: scaleFont,
                                    style: const TextStyle(fontSize: 13),
                                  )),
                              Expanded(
                                child: Text(
                                  'RS${order.priceMultiplied.toStringAsFixed(2)}',
                                  textScaleFactor: scaleFont,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const Expanded(
                            child: SizedBox(
                          child: Text(
                            'Valor total:',
                            textScaleFactor: 1.3,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              total!.toStringAsFixed(2),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1.5,
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SimpleButtonC(
                            text: 'Confirmar',
                            primary: true,
                            onClick: () {
                              final List<ProductModel> newEditedProducts =
                                  orders!.map((order) {
                                final newQuantity =
                                    order.product.quantity - order.quantity;
                                return ProductModel(
                                  id: order.product.id,
                                  name: order.product.name,
                                  price: order.product.price,
                                  quantity: newQuantity,
                                );
                              }).toList();
                              eventsBox
                                  .updateManyProducts(newEditedProducts)
                                  .then((value) => print(
                                      'Produtos modificados com sucesso!'));
                              Get.offAllNamed(
                                '/pdfpage',
                                arguments: {
                                  'orders': orders!,
                                  'total': total,
                                  'client': clientName,
                                },
                              );
                            }),
                        SimpleButtonC(
                          text: 'Cancelar',
                          onClick: () => Get.back(result: false),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  const Text(
                    'Nenhum produto adicionado!',
                    textAlign: TextAlign.center,
                  ),
                  const Divider(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SimpleButtonC(
                        text: 'Sair',
                        onClick: () => Get.back(),
                      )
                    ],
                  ),
                ],
              ),
      ],
    );
  }
}
