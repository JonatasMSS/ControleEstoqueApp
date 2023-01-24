// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:genilson_app/models/OrderModel/OrderModel.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';

class ProductComponent extends StatefulWidget {
  final ProductModel produto;
  List<OrderModel>? orderPage;
  final Function()? changeSumationOnPage;
  final Function()? onClickEdit;
  final Function()? onClickRemove;
  final bool isEditable;
  ProductComponent({
    Key? key,
    required this.produto,
    this.orderPage,
    this.changeSumationOnPage,
    this.onClickEdit,
    this.onClickRemove,
    this.isEditable = false,
  }) : super(key: key);

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  late int quantity;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      quantity = widget.produto.quantityToOrder;
    });
    super.initState();
  }

  void addToOrder() {
    final bool isInside =
        widget.orderPage?.any((order) => order.product == widget.produto) ??
            false;
    if (isInside) {
      final int index = widget.orderPage
              ?.indexWhere((order) => order.product == widget.produto) ??
          -2;
      setState(() {
        widget.orderPage?[index] = OrderModel(
            product: widget.produto,
            quantity: widget.produto.quantityToOrder,
            priceMultiplied: widget.produto.quantityMultplied);
      });
    } else {
      final OrderModel newOrder = OrderModel(
          product: widget.produto,
          quantity: widget.produto.quantityToOrder,
          priceMultiplied: widget.produto.quantityMultplied);
      setState(() {
        widget.orderPage?.add(newOrder);
      });
    }
  }

  void removeFromOrder() {
    final int index = widget.orderPage
            ?.indexWhere((order) => order.product == widget.produto) ??
        -1;
    if (index >= 0) {
      setState(() {
        widget.orderPage?.removeAt(index);
      });
    }
  }

  void addQuantity() {
    setState(() {
      if (quantity < widget.produto.quantity) {
        quantity += 1;
        widget.produto.quantityToOrder = quantity;
      }
      // } else {
      //   quantity = quantity;
      // }
      widget.produto.quantityMultplied =
          widget.produto.price * widget.produto.quantityToOrder;
    });
  }

  void lessQuantity() {
    setState(() {
      if (quantity <= 0) {
        quantity = 0;
      } else {
        quantity -= 1;
      }
      widget.produto.quantityToOrder = quantity;
      widget.produto.quantityMultplied = widget.produto.price * quantity;
    });
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
                    widget.produto.name,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'RS ${widget.produto.price.toStringAsFixed(2)} UN',
                    textScaleFactor: 1.1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Em estoque: ${widget.produto.quantity}',
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
                localPriceVar: widget.produto.quantityMultplied,
                produto: widget.produto,
                quantity: widget.produto.quantityToOrder,
                isEditable: widget.isEditable,
                onTapAdd: () {
                  addQuantity();
                  addToOrder();
                  if (widget.changeSumationOnPage != null) {
                    widget.changeSumationOnPage!();
                  }

                  // setState(() {
                  //   quantity = quantity < widget.produto!.quantity
                  //       ? quantity += 1
                  //       : quantity;

                  //   widget.produto!.quantityMultplied =
                  //       widget.produto!.price * quantity;
                  // });
                },
                onTapLess: () {
                  lessQuantity();
                  if (quantity > 0) {
                    addToOrder();
                  } else {
                    removeFromOrder();
                  }
                  if (widget.changeSumationOnPage != null) {
                    widget.changeSumationOnPage!();
                  }
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
                    child: Text(
                        'RS ${widget.produto.quantityMultplied.toStringAsFixed(2)}',
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
  int quantity;
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
