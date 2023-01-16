// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:genilson_app/models/OrderModel/OrderModel.dart';

class ConfirmationDialog extends StatelessWidget {
  final List<OrderModel>? orders;

  const ConfirmationDialog({
    Key? key,
    this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Confirmação de Pedido'),
      children: [
        orders!.length > 0
            ? SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orders?.length ?? 1,
                  itemBuilder: (context, index) {
                    final OrderModel? order = orders?[index];
                    final double scaleFont = 1.3;
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
              )
            : const Text(
                'Nenhum produto adicionado!',
                textAlign: TextAlign.center,
              ),
      ],
    );
  }
}
