// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/SimpleButtonC/SimpleButtonC.dart';

import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:get/get.dart';

class ConfirmationDialog extends StatelessWidget {
  final List<OrderModel>? orders;
  final double? total;

  const ConfirmationDialog({
    Key? key,
    this.orders,
    this.total,
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
                        const double scaleFont = 1.3;
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '${order!.quantity}x',
                                textAlign: TextAlign.center,
                                textScaleFactor: scaleFont,
                              )),
                              Expanded(
                                  child: Text(
                                order.product.name,
                                textScaleFactor: scaleFont,
                              )),
                              Expanded(
                                child: Text(
                                  'RS${order.priceMultiplied}',
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
                        ),
                        SimpleButtonC(
                          text: 'Cancelar',
                          onClick: () => Get.back(),
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
