// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/pages/FazerPedidoPage/FazerPedidoPage.dart';
import 'package:get/get.dart';

import 'package:genilson_app/components/InputFormComponent/InputFormComponent.dart';
import 'package:genilson_app/components/SimpleButtonC/SimpleButtonC.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';

class ProductAddDialog extends StatefulWidget {
  final TextEditingController? nameController;
  final TextEditingController? quantityController;
  final TextEditingController? priceController;
  final ProductModel produto;

  const ProductAddDialog({
    Key? key,
    this.nameController,
    this.quantityController,
    this.priceController,
    required this.produto,
  }) : super(key: key);

  @override
  State<ProductAddDialog> createState() => _ProductAddDialogState();
}

class _ProductAddDialogState extends State<ProductAddDialog> {
  late Map<String, TextEditingController?> controllers;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      controllers = {
        'nameC': widget.nameController,
        'quantityC': widget.quantityController,
        'priceC': widget.priceController,
      };
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3), topRight: Radius.circular(3)),
        ),
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: Text(
            'Adicionar novo produto',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      children: [
        const SizedBox(
          height: 7,
        ),
        InputFormComponent(
          controller: controllers['nameC'],
          titleForm: 'Nome do produto',
          placeholder: 'Digite o nome do produto',
          fontSize: 1.5,
          type: TextInputType.name,
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          children: [
            Expanded(
              child: InputFormComponent(
                controller: controllers['quantityC'],
                titleForm: 'Quantidade',
                placeholder: 'Em estoque',
                fontSize: 1.5,
                type: TextInputType.number,
              ),
            ),
            Expanded(
              child: InputFormComponent(
                controller: controllers['priceC'],
                titleForm: 'Preco unitário',
                placeholder: 'Valor unitário',
                type: TextInputType.number,
                fontSize: 1.5,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SimpleButtonC(
                primary: true,
                text: 'Confirmar',
                onClick: () => Get.back(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SimpleButtonC(
                text: 'Cancelar',
                onClick: () => Get.back(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}
