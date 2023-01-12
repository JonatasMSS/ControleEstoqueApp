// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/pages/ProdutosPage/ProdutosPage.dart';
import 'package:get/get.dart';

import 'package:genilson_app/models/ProductModel/ProductModel.dart';

import '../../../components/InputFormComponent/InputFormComponent.dart';
import '../../../components/SimpleButtonC/SimpleButtonC.dart';

class EditDialog extends StatefulWidget {
  final ProductModel? produto;

  const EditDialog({
    Key? key,
    this.produto,
  }) : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  TextEditingController nameController =
      TextEditingController(text: produto.name);
  TextEditingController priceController =
      TextEditingController(text: produto.price.toString());
  TextEditingController quantityController =
      TextEditingController(text: produto.quantity.toString());

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
          controller: nameController,
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
                controller: quantityController,
                titleForm: 'Quantidade',
                placeholder: 'Em estoque',
                fontSize: 1.5,
                type: TextInputType.number,
              ),
            ),
            Expanded(
              child: InputFormComponent(
                controller: priceController,
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
