// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:genilson_app/models/ProductModel/ProductModel.dart';

class ProductComponent extends StatefulWidget {
  final ProductModel? produto;
  final Function()? onClickEdit;
  final Function()? onClickRemove;
  final bool isEditable;
  const ProductComponent({
    Key? key,
    this.produto,
    this.onClickEdit,
    this.onClickRemove,
    this.isEditable = false,
  }) : super(key: key);

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  double quantityMultiplied = 0;
  late int quantity;
  @override
  void initState() {
    // TODO: implement initState

    quantity = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 2),
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TEXT SECTION
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.produto?.name ?? 'NO DATA',
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'RS ${widget.produto!.price} UN',
                    textScaleFactor: 1.1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Em estoque: ${widget.produto?.quantity ?? 0}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 66, 66, 66),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),

            Visibility(
              visible: !widget.isEditable,
              child: CounterItem(
                localPriceVar: quantityMultiplied,
                produto: widget.produto,
                quantity: quantity,
                isEditable: widget.isEditable,
                onTapAdd: () {
                  setState(() {
                    quantity = quantity < widget.produto!.quantity
                        ? quantity += 1
                        : quantity;

                    quantityMultiplied = widget.produto!.price * quantity;
                  });
                },
                onTapLess: () {
                  setState(() {
                    quantity = quantity <= 0 ? 0 : quantity -= 1;
                    quantityMultiplied = widget.produto!.price * quantity;
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: widget.isEditable
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: !widget.isEditable,
                    child: Text('RS ${quantityMultiplied.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Visibility(
                    visible: widget.isEditable,
                    child: GestureDetector(
                      onTap: widget.onClickRemove,
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFFF4747),
                        maxRadius: 19,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.isEditable,
                    child: GestureDetector(
                      onTap: widget.onClickEdit,
                      child: const CircleAvatar(
                        backgroundColor: Colors.amber,
                        maxRadius: 19,
                        child: Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

// ignore: must_be_immutable
class CounterItem extends StatefulWidget {
  ProductModel? produto;
  double localPriceVar;
  final int quantity;
  final bool isEditable;
  final Function()? onTapAdd;
  final Function()? onTapLess;
  CounterItem({
    Key? key,
    this.produto,
    required this.localPriceVar,
    this.quantity = 0,
    required this.isEditable,
    this.onTapAdd,
    this.onTapLess,
  }) : super(key: key);

  @override
  State<CounterItem> createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: widget.onTapLess,
            child: const CircleAvatar(
              maxRadius: 15,
              backgroundColor: Color(0xFFFF4747),
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
          Text('${widget.quantity}'),
          GestureDetector(
            onTap: widget.onTapAdd,
            child: const CircleAvatar(
              maxRadius: 15,
              backgroundColor: Color(0xFF6AFF79),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
